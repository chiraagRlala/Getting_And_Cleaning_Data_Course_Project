# Loading Train and Test data
subject_test <- read.table('test/subject_test.txt', sep = '')
subject_train <- read.table('train/subject_train.txt', sep = '')
X_test <- read.table('test/X_test.txt', sep = '')
X_train <- read.table('train/X_train.txt', sep = '')
y_test <- read.table('test/y_test.txt', sep = '')
y_train <- read.table('train/y_train.txt', sep = '')

# Row Binding with Train above and Test below
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
activity <- rbind(y_train, y_test)

# Column binding the Subject and Activity to X (Measurements)
data <- data.frame(subject = subject, activity = activity, X = X)

# Relevant columns as a vector of indices
# This includes Subject, Activity, and Mean and Standard Deviation of Measurements
# A subset of features (subfeatures.txt) was created manually from features.txt
# Relevant column indices identified using the subfeatures.txt
subfeatures <- read.table('subfeatures.txt', sep = '')
shiftindex <- subfeatures$V1 + 2
columnindex <- c(1, 2, shiftindex)

# Load dplyr library to select the relevant columns
library(dplyr)
data <- select(data, columnindex)

# Loading activity labels
activity_labels <- read.table('activity_labels.txt', sep = '')

# Changing second column of data.frame (that corresponds to activity) to factor class
# and rename its levels using activity_labels from above

data$V1.1 <- factor(data$V1.1)
levels(data$V1.1) <- activity_labels$V2

# Change the names of the columns to be descriptive
# New descriptive names for measurements obtained from subfeatures.txt
subfeatures$V2 <- as.character(subfeatures$V2)
newnames <- c("Subject", "Activity", subfeatures$V2)
colnames(data) <- newnames

# Group the data by the ids (Subject and Activity pairs)
# And summarise the mean of every variable for each (Subject, Activity) pair
grouped <- group_by(data, Subject, Activity)
ans <- summarise_each(grouped, funs(mean))
# We get a data frame of 180 observations (Subject-Activity pairs, 30 subjects x 6 activities)
# and 68 columns. Firs two columns are id (Subject and Activity), columns 3 to 68 are the 
# means and standard deviation of all the measures (meanFrequence and angle measures not included)


# Write the ans table in .txt file
write.table(ans, file = 'answer_tidy_dataset.txt', row.names = FALSE)