# How long does it take to get a tenure-track job in academic philosophy? 

*Surprisingly, less than 2-years! And slightly less than the average time for grads from the top programs (see below)* 

Here's a summary of data from philjobs.org:

![alt text](https://github.com/ljelkin/jobplacement/blob/master/time_summary.png)

Notice that there are some extreme cases where 'success' took 20 years. To get a better sense of 'success', here are the boxplot and densityplot:


![alt text](https://github.com/ljelkin/jobplacement/blob/master/boxplot.png)

![alt text](https://github.com/ljelkin/jobplacement/blob/master/density.png)


# The analysis 

When selecting the data, I used three criteria: (1) ‘type’ must be “Tenured/Tenure-Track”, (2) ‘job title’ must be “Assistant Professor” (ignore all promotions, e.g. Associate Professor), and (3) the time till a TT position is obtained must be 0 or greater. (Note on (3): while there are instances where a candidate gets an offer before completing their Ph.D., some of the data showed that a TT job was held up to 11 years before completing a Ph.D.! These entries most likely were inputted incorrectly.) Any entry that doesn't satisfy the criteria was removed. 

There were 7305 entries in the philjobs.org dataset, but only 1382 entries were used in the analysis after subsetting. It is, of course, possible that there are a significant number of TT entries that were excluded, so I calculated the 95% confidence interval, which turned out to be 1.857 +- 0.125.


# Does the quality of Ph.D. program make a difference?


Yes! But only slightly:

![alt text](https://github.com/ljelkin/jobplacement/blob/master/pgr_time_summary.png)

However, some grads from certain programs seem to do better than others.

![alt text](https://github.com/ljelkin/jobplacement/blob/master/bargraph.png)

In sum, prospective students should not only consider their prospects for landing a TT job after obtaining a Ph.D. in philosophy, but also the number of years they might have to endure in temporary jobs.

(Note: Some programs had very few entries. This is especially true for programs outside of the US, e.g., Cambridge. A few only had one entry (Carnegie Mellon, Miami, and UCL) and so they were removed.)
