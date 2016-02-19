# DataCleaningCourse

Original Description of the Samsung Activity Data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 
readings/window). The sensor acceleration signal, which has gravitational and body motion 
components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 
acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Cleaning and Summarizing the Data to generate the current analysis:

The tidydata.csv file contains a summarized analysis of the Samsung activity data.

Each column represents a mean of the given measurement grouped by subject and activity.

The analysis was created using the r script file run_analysis.R in the same directory
as this Readme file.

The training set and test set data were merged.
The columns containing values for mean and standard deviation measurements were extracted.
The columns were subsequently averaged to give the mean of each measurement by subjects
(n = 30) and by activity type (n=6) to yield a 180 row (subject x activity) by 68 column
(66 measurement means + subject ID column + activity ID column)
