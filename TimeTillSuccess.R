library(sqldf)
library(data.table)

#Load data from APA's philjobs.org website
data <- fread('https://philjobs.org/appointments/csvPlacements')

#Remove entries that are non-tenure-track, promotion (e.g. promoted to Associate), TT job before completing PhD
df_sql <- sqldf("SELECT * FROM data WHERE (type='Tenured/Tenure-Track') AND (`job title`='Assistant Professor') AND ((year-`year of phd`) >= 0)")

#Years between completing a PhD and securing a TT position + summary
success <- df_sql$year-df_sql$'year of phd'
summary(success)

#Visualize success in boxplot
quartzFonts(avenir=c('Avenir Book', 'Avenir Black', 'Avenir Book Oblique', 'Avenir Black Oblique'))
png('boxplot.png', width=650)
par(mar=c(3, 4, 3, 4), family='avenir', cex.axis=.95)
boxplot(success, col='lightcoral', ylab='Years')
dev.off()

#Visualize success in densityplot
png('density.png', width=650)
par(mar=c(3, 4, 3, 4), family='avenir', cex.axis=.95)
plot(density(success), ylim=c(0, 0.4), main='Time Till Success Plot')
polygon(density(success), col='lightcoral', border='black')
dev.off()

#Confidence Interval for success
stand.deviation <- sd(success)
stand.deviation
margin.error <- qnorm(0.975)*(stand.deviation/sqrt(length(success)))
margin.error
mean(success)-margin.error
mean(success)+margin.error
