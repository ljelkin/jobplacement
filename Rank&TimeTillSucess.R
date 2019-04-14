library(sqldf)
library(ggplot2)
library(data.table)

#Load data from APA's philjobs.org website
data <- fread('https://philjobs.org/appointments/csvPlacements')

#Load PGR ranking data 
PGR <- fread('[Add Your Work Directory]/LeiterRanking.csv')

#Fix strings; remove entries that are non-tenure-track, promotion (e.g. promoted to Associate), TT job before completing PhD
df_sql <- sqldf("SELECT *, REPLACE(REPLACE(REPLACE(REPLACE(`phd from`, 'University of Texas at Austin', 'University of Texas, Austin'),'University of California at Irvine', 'University of California, Irvine'), 'CUNY', 'City University of New York Graduate Center'), 'UCLA', 'University of California, Los Angeles') AS `program` FROM data WHERE (type='Tenured/Tenure-Track') AND (`job title`='Assistant Professor') AND ((year-`year of phd`) >= 0)")

#Extract INSTITUTION column from PGR
pgr_sql <- sqldf("SELECT INSTITUTION FROM PGR")

#Query all entries partially matching PGR top programs globally
m <- sqldf("SELECT * FROM df_sql WHERE EXISTS(SELECT * FROM pgr_sql WHERE CHARINDEX(INSTITUTION, program) > 0)")

#Make table with Year, Year of PhD, and Program only
n <- sqldf("SELECT year, `year of phd`, CASE WHEN EXISTS(SELECT * FROM pgr_sql WHERE CHARINDEX(INSTITUTION, program) > 0 ) THEN REPLACE(program, program, (SELECT INSTITUTION FROM pgr_sql WHERE CHARINDEX(INSTITUTION, program) > 0)) END AS PGR FROM m ORDER BY PGR"
  )

#(Back to R) Add a column to data frame with the time to TT
n <- cbind(n, (n$year-n$`year of phd`))
names(n) <- c('year', 'phd year', 'program', 'time')

#Convert programs to factors
n$program <- as.factor(n$program)

#Make data table with a summary of each program's average time to TT
dat_table <- data.table(n)
dat_summary <- dat_table[, list(mean=mean(time), sd=sd(time)), by=program]
remove_insuff <- dat_summary[!is.na(dat_summary$sd)]

#Visualize the results in barplot + save copy
quartzFonts(avenir=c('Avenir Book', 'Avenir Black', 'Avenir Book   
  Oblique','Avenir Black Oblique'))
png('bargraph.png', width=1200, height=600)
par(mar=c(3, 12, 3, 4), family='avenir', cex.axis=.8)
p <- ggplot(remove_insuff, aes(program, mean)) + geom_bar(stat='identity', color='white', fill=rgb(0.1,0.4,0.5,0.7))
p + coord_flip() + labs(x='Program', y='Average (in years)', title='Average time till TT Position for the Top Programs') + theme(text=element_text(size=16, family='Avenir Book'))
dev.off()