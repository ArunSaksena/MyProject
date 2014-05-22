My Codebook
========================================================

In the tidy dataset called **"myTidyDataSet.txt"** I have 10,299 rows and 8 columns.  Out of a total of 563 variables in the raw dataset (called **"mergedfile2.txt"**), I selected 8 variables.  These variables, associated trsnaformation and other important data is described below:
* Subject:  This is the Volunteer
* Activity:  I transformed the numbers to more meaningful labels.  For example, I changed 1 to "Walking", 2 to "Walking_Upstairs", 3 to "Walking_downstairs", 4 to "Sitting", 5 to "Standing", and 6 to "Laying".
* The tidy data set is sorted, first by Subject and then by Activity.
* The other 6 variables are the 3-axial linear body acceleration -- Mean and Standard Deviation.  they have all been given meaningful english names.
*  The Body Acceleration numbers were based on time domain signals captured by the accelerometer on the Subject's smartphone.  The signals were captured 50 times / second (50 Hz) and various filtering and noise reduction techniques have been applied to clean up the data
* Units of linear body acceleration are in **"gravity units"**