datascience_gettingCleaningData
===============================

Datascience special track: getting and cleaning data @ coursera

This script uses the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

* Download the datafile (USI HAR Dataset) and extraxt it into a subfolder of the directory containing the R-Script (run_analysis.R). Take care that the original folder structure is established.
* Run the R-Script. 
* If there did not occure any errors the script created a new textfile with the top folder of the project-structure called "tidydata.txt". This file contains all factors that contain either "mean()" or "std()", grouped by activities and subject ids.
