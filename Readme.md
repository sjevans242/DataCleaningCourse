The tidydata.csv file contains a summarized analysis of the Samsung activity data.

Each column represents a mean of the given measurement grouped by subject and activity.

The analysis was created using the r script file run_analysis.R in the same directory
as this Readme file.

The training set and test set data were merged.
The columns containing values for mean and standard deviation measurements were extracted.
The columns were subsequently averaged to give the mean of each measurement by subjects
(n = 30) and by activity type (n=6) to yield a 180 row (subject x activity) by 68 column
(66 measurement means + subject ID column + activity ID column)