run_analysis <- function()  {
	
	## set path and working directory
	
	path <- "/Users/arsaksen/Documents/Mac Documents September 1 2011/Coursera Data Science Track/Getting and Cleaning Data/Project/UCI HAR Dataset"
	setwd(path)

	
	## read Files

	testLabels_file <- read.table("test/y_test.txt", header = FALSE, sep = "\n")
	testSet_file <- read.table("test/X_test.txt", header = FALSE, sep = "\n", stringsAsFactors = FALSE)
	testsubjects <- read.table("test/subject_test.txt")
	trainingLabels_file <- read.table("train/y_train.txt", header = FALSE, sep = "\n")
	trainingSet_file <- read.table("train/X_train.txt", header = FALSE, sep = "\n", stringsAsFactors = FALSE)
	trainingsubjects <- read.table("train/subject_train.txt")

	testRows <- nrow(testSet_file)
	trainingRows <- nrow(trainingSet_file)

	source("Project1/AnalysisforTidyData.R")


	##Initialize a new Data Frame 
	j <- 3

	working_Data <- data.frame()  ## Final sorted working data frame

	print("Entering test labels loop...")


	for (n in 1 : testRows)  {
		working_Data[n,1] <- testLabels_file[n,1]
		if (working_Data[n,1] == 1) {
			working_Data[n,1] <- "Walking"
		}
		if (working_Data[n,1] == 2) {
			working_Data[n,1] <- "Walking_Upstairs"
		}
		if (working_Data[n,1] == 3) {
			working_Data[n,1] <- "Walking_Downstairs"
		}
		if (working_Data[n,1] == 4) {
			working_Data[n,1] <- "Sitting"
		}
		if (working_Data[n,1] == 5) {
			working_Data[n,1] <- "Standing"
		}
		if (working_Data[n,1] == 6) {
			working_Data[n,1] <- "Laying"
		}
		working_Data[n,2] <- testsubjects[n,1]
	}

	print("Entering test set loop...")

	for (n in 1 : testRows)  {
		testRecord <- strsplit(testSet_file[n,1], " ")
		MynewTest <- testRecord[[1]]
		for (a in 1 : length(MynewTest)) {
			if (!(MynewTest[a] == ""))  {
				working_Data[n,j] <- MynewTest[a]
				j <- j + 1
			}
		}
		j <- 3

	}


	j <- nrow(working_Data) + 1
	i <- 1

	print("Entering training labels loop...")

	for (n in j : (j+trainingRows - 1))  {
		working_Data[n,1] <- trainingLabels_file[i,1]
		if (working_Data[n,1] == 1) {
			working_Data[n,1] <- "Walking"
		}
		if (working_Data[n,1] == 2) {
			working_Data[n,1] <- "Walking_Upstairs"
		}
		if (working_Data[n,1] == 3) {
			working_Data[n,1] <- "Walking_Downstairs"
		}
		if (working_Data[n,1] == 4) {
			working_Data[n,1] <- "Sitting"
		}
		if (working_Data[n,1] == 5) {
			working_Data[n,1] <- "Standing"
		}
		if (working_Data[n,1] == 6) {
			working_Data[n,1] <- "Laying"
		}
		working_Data[n,2] <- trainingsubjects[i,1]
		i <- i + 1
	}	

	i <- 1
	p <- 3

	print("Entering training set loop...")

	for (n in j : (j + trainingRows - 1))  {
		trainRecord <- strsplit(trainingSet_file[i,1], " ")
		MynewTrain <- trainRecord[[1]]
		for (a in 1 : length(MynewTrain)) {
			if (!(MynewTrain[a] == ""))  {
				working_Data[n,p] <- MynewTrain[a]
				p <- p + 1
			}
		}
		p <- 3
		i <- i + 1

	}

	## So, now we have working_Data as the merged Data Frame.  We need to add column names from features.txt

	myheading <- as.character()

	myheading[1] <- "Activity"
	myheading[2] <- "Subject"

	features <- "features.txt"

	con <- file(features, open = "r")

	i <- 3

	while (length(featureL <- readLines(con, n = 1, warn = FALSE)) > 0)  {
		f1 <- strsplit(featureL, " ")
		f2 <- f1[[1]]
		myheading[i] <- f2[2]
		i <- i + 1
	}

	close(con)
	
	names(working_Data) <- myheading

	print("Some Details on working_Data....")
	print(dim(working_Data))
	print(names(working_Data))


	write.table(working_Data, file = "mergedfile2.txt", sep = " ", col.names = TRUE, eol = "\r")

	print("Performing Analysis for Tidy Data")
	
	AnalysisforTidyData()

}