## run_analysis.R
===============================

Datascience special track: getting and cleaning data @ coursera

This script uses the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

* Download the datafile (USI HAR Dataset) and extraxt it into a subfolder of the directory containing the R-Script (run_analysis.R). Take care that the original folder structure is established.
* Run the R-Script. 
* If there did not occure any errors the script created a new textfile with the top folder of the project-structure called "tidydata.txt". This file contains all factors that contain either "mean()" or "std()", grouped by activities and subject ids.

## data processing steps
===============================

* import the traing and the test data sets
* merge these datasets together
* merge with the subject id datasets
* assign the column names given in the file features.txt
* add additional column activity_descr to give a better insight which activity was done (walk, step up, step down, etc.)
* melt the dataset by the activityId and the subjectId
* Do recast with the melted dataset and apply mean as an aggregator function
* Create a new textfile "tidydata.txt" and write the generated data into this file
