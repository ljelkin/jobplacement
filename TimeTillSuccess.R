library(dplyr)
library(ggplot2)
library(data.table)

#Retrieve raw data from the APA's philjobs.org website
raw.data <- fread('https://philjobs.org/appointments/csvPlacements')

#Subset the data by removing rows that are missing 'Year of PhD' data, that are non-tenure-track entries, that are promotion entries (e.g. promoted to Associate Prof.), and that mark a TT job before completing PhD
subset.data <- raw.data[ (raw.data$'year of phd'!= "") & (raw.data$type == "Tenured/Tenure-Track") & (raw.data$'job title' == "Assistant Professor") & (raw.data$year - raw.data$'year of phd' >= 0) ]

#Find the number of years between completing a PhD and securing a TT job
time.till.success <- subset.data$year - subset.data$'year of phd'

summary(time.till.success)

#Visualize distribution through Boxplot
quartzFonts(avenir = c("Avenir Book", "Avenir Black", "Avenir Book Oblique",
                       "Avenir Black Oblique"))
png("boxplot.png", width=650)
par(mar=c(3, 4, 3, 4), family='avenir', cex.axis=.95)
boxplot(time.till.success, col="lightcoral", ylab="Years")
dev.off()

#Visualize Distribution through Density Plot
png("histogram.png", width=650)
par(mar=c(3, 4, 3, 4), family='avenir', cex.axis=.95)
plot(density(time.till.success), ylim=c(0, 0.4), main="Time Till Success Plot")
polygon(density(time.till.success), col="lightcoral", border="black")
dev.off()

#Find Confidence Interval for Time.Till.Success
stand.deviation <- sd(time.till.success)
stand.deviation
margin.error <- qnorm(0.975) * (stand.deviation / sqrt(length(time.till.success)))
margin.error
mean(time.till.success) - margin.error
mean(time.till.success) + margin.error
