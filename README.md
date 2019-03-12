# How long does it take to get a tenure-track job in academic philosophy? 

*Surprisingly, less than 2-years!* 

Here's a summary of data from philjobs.org:

![alt text](https://github.com/ljelkin/jobplacement/blob/master/summary.png)

Notice that there are some extreme cases where 'time till success' took 20 years. To get a better sense of 'time till success', here are the boxplot and density plot:


![alt text](https://github.com/ljelkin/jobplacement/blob/master/boxplot.png)

![alt text](https://github.com/ljelkin/jobplacement/blob/master/density.png)


# The analysis 

When selecting the data, I used four criteria: (1) ‘year of phd’ data must be entered, (2) ‘type’ must be “Tenured/Tenure-Track”, (3) ‘job title’ must be “Assistant Professor” (ignore all promotions, e.g. Associate Professor), and (4) the time till a TT position is obtained must be 0 or greater. (Note on (4): while there are instances where a candidate gets an offer before completing their Ph.D., some of the data showed that a TT job was held up to 11 years before completing a Ph.D.! These entries most likely were inputted incorrectly.) Any entry that doesn't satisfy the four criteria was removed. 

There were 7212 entries in the philjobs.org dataset, but only 1345 entries were used in the analysis after subsetting. It is, of course, possible that there are a significant number of TT entries that were excluded, so I calculated the 95% confidence interval, which turned out to be 1.834 +- 0.126.
