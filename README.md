Introduction
========================================================

I followed the following steps and methodology for the project:
* I first wrote an R script for combining the Test Set and the Training Set.  The script is called:  **"combineTrainandTestData.R"**.  This included combining the following files:
  * Test labels:  test/y_test.txt
  * Test subjects:  test/subject_test.txt
  * Test set:  test/X_test.txt
  * Training labels:  train/y_train.txt
  * Trainingt subjects:  train/subject_train.txt
  * Training set:  train/X_train.txt
* I converted the Activity Labels from numbers into meaningful and understandable names:  For example, 1 was converted to "Walking" and so on
* The script took several hours to execute, and so I have inserted several print statements to help me keep track of where the code is in its state of execution
* The resulting data frame has 10,299 rows and 563 columns.  Not quite a "Big Data" Dataset, but big enough for me
* Finally, I wrote the data frame to a file called **"mergedfile2.txt"**

Next, I wrote an R script called **"AnalysisforTidyData.R"** to read "mergedfile2.txt" and extract only the variables that I thought would be of interest for the specific insights I would like to extract.  These variables are as follows:

* **Subject** -- clearly, we want to do the analysis by subject.  There are 30 volunteers, ages ranging from 19 - 48 years, and we want the data by subject
* **Activity** -- We want to understand mean and standard deviation of the triaxial body acceleration by Activity and by Subject
* **Mean Body Acceleration** for X, Y and Z axes
* **Standard Deviation of Body Acceleration** for X, Y and Z axes

These measures should enable us to understand the average and spread of acceleration by activity and by subject.

My Tidy Dataset is called:  **"myTidyDataSet.txt"**  All files should be in my Github repo.
