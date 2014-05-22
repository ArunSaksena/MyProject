AnalysisforTidyData <- function()  {
	
	## set path and working directory
	
	path <- "/Users/arsaksen/Documents/Mac Documents September 1 2011/Coursera Data Science Track/Getting and Cleaning Data/Project/UCI HAR Dataset"
	setwd(path)

	
	## read Files

	myTable <- read.table("mergedfile2.txt", header = TRUE, row.names = 1, stringsAsFactors = FALSE)

	tableRows <- nrow(myTable)

	##Initialize a new Data Frame 
	
	j <- 1
	temp_working_Data <- data.frame()
	working_Data <- data.frame()  ## Final sorted working data frame


	for (n in 1 : tableRows)  {
		temp_working_Data[n,1] <- myTable[n,2] #Make the first column "Subject"
		temp_working_Data[n,2] <- myTable[n,1] #Make the second column "Activity"
		temp_working_Data[n,3] <- myTable[n,3]
		temp_working_Data[n,4] <- myTable[n,4]
		temp_working_Data[n,5] <- myTable[n,5]
		temp_working_Data[n,6] <- myTable[n,6]
		temp_working_Data[n,7] <- myTable[n,7]
		temp_working_Data[n,8] <- myTable[n,8]
	}

	print("Some Details on temp_working_Data....")
	print(dim(temp_working_Data))

	myheading <- as.character()

	myheading[1] <- "Subject"
	myheading[2] <- "Activity"
	myheading[3] <- "Mean Body Acceleration X-Axis"
	myheading[4] <- "Mean Body Acceleration Y-Axis"
	myheading[5] <- "Mean Body Acceleration Z-Axis"
	myheading[6] <- "Standard Deviation of Body Acceleration X-Axis"
	myheading[7] <- "Standard Deviation of Body Acceleration Y-Axis"
	myheading[8] <- "Standard Deviation of Body Acceleration Z-Axis"


	num_Row <- nrow(temp_working_Data)

	val <- order(temp_working_Data[,1], temp_working_Data[,2])

	for (i in 1:num_Row) {
		j <- val[i]
		working_Data[i,1] <- temp_working_Data[j,1]
		working_Data[i,2] <- temp_working_Data[j,2]
		working_Data[i,3] <- temp_working_Data[j,3]
		working_Data[i,4] <- temp_working_Data[j,4]
		working_Data[i,5] <- temp_working_Data[j,5]
		working_Data[i,6] <- temp_working_Data[j,6]
		working_Data[i,7] <- temp_working_Data[j,7]
		working_Data[i,8] <- temp_working_Data[j,8]
	}

	names(working_Data) <- myheading

		
	print("Some Details on working_Data....")
	print(dim(working_Data))
	print(names(working_Data))


	write.table(working_Data, file = "myTidyDataSet.txt", sep = " ", col.names = TRUE, eol = "\r")

}