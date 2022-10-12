#  Day 3 R Exercise 1

# Open a new Rstudio script and create 3 new objects

a <- "a"
b <- "b"
c <- "c"

#  Save workspace as .RData file
save.image(file = "Day_2_Exercise1.RData")

# Save one object using saveRDS()

saveRDS(a, file ="a.RDS")

# Remove one of the objects

rm(b)
ls()

# Clear your workspace completely (remove all objects)

rm(list = ls())
ls()

# Display your current working directory

getwd()

# # Make a new directory in your linux terminal and then set the R
# working directory to be that new directory.

setwd("/t1-data/project/obds/slaw/2_baseR/projects/Day3")
getwd()

# 8. Load the objects you saved in the .Rdata file

a <- readRDS("a.RDS")
readRDS


# 1. Use readRDS() to load to an object called
# /t1-data/project/obds/shared/resources/2_r/my_day2matrix.rds

my_day2matrix <- readRDS("/t1-data/project/obds/shared/resources/2_r/my_day2matrix.rds")
head(my_day2matrix)
dim(my_day2matrix)

# 2. Add row sums and means to this dataset
my_day2matrix1 <- cbind(my_day2matrix, rowSums(my_day2matrix), 
                       rowMeans(my_day2matrix))
dim(my_day2matrix1)
head(my_day2matrix1)

# Add column sums and means

my_day2matrix2 <- rbind(my_day2matrix1, c(colSums(my_day2matrix), NA, NA), c(colMeans(my_day2matrix), NA, NA))
dim(my_day2matrix2)
print(my_day2matrix2)

# 3. Load the ToothGrowth datset using data(ToothGrowth)
data("ToothGrowth")

# 4. How do find more information on this dataset?


#   5. What columns of data do we have?
colnames(ToothGrowth)


dim(ToothGrowth)

head(ToothGrowth)

#   6. What is the mean tooth length?
mean(ToothGrowth$len)

#   7. What is the maximum and minimum weight of the chicks?
max(ToothGrowth$len)
min(ToothGrowth$len)

#   8. Can you calculate rowSums and rowMeans on this data? no because column cotaning string/characters



# Exercise 3 - Sorting
# 1. Load the AirQuality dataset.

data("airquality")


# 2. Look up more information about this dataset.
# 3. Examine the dataset – how many rows and columns are there?

dim(airquality)

colnames(airquality)

#   4. Display the column headers.
# 5. Sort the dataframe by the first column (Ozone) in ascending order.

airquality2 <- airquality[order(airquality$Ozone),]
head(airquality2)

# 6. Sort the dataframe by the Month and then the Temp column in
# descending order and save to a new variable.

airquality2 <- airquality[order(airquality$Month,airquality$Temp,decreasing = TRUE),]
head(airquality2)

# 7. Save this sorted data to a file on the server

write.table(airquality2, file= 'airquality_ordered_month_temp.csv', sep=",", quote = FALSE, row.names = FALSE)

getwd()


# Exercise 4 - Merging

# • Create the dataframes called buildings and data to merge:
data(buildings)

buildings <- data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))
buildings

data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1), efficiency=c(51,64,70,71,80,58))
data


#   buildings <- data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))
# data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1),
#                    efficiency=c(51,64,70,71,80,58))
# • What is the common key variable in these dataframes? location

#   • Use the merge() function to merge the two dataframes by the common
# key variable into a new dataframe called buildingStats.

buildingStats <- merge(x = buildings, y = data, by = "location", all = TRUE)
buildingStats


# Exercise 5 - Aggregate
# 1. Aggregate (or group) the airquality data by Month and return
# means on each of the numeric variables. Also, remove “NA” values.

agg = aggregate(airquality, by = list(Month = airquality$Month), FUN = mean, na.rm=T)
agg

# 2. Aggregate the Solar.R column by Month, returning means of
# Solar.R The header of column 1 should be Month. Remove “not
# available” values.

agg = aggregate(airquality$Solar.R, by = list(Month = airquality$Month), FUN = mean, na.rm=T)
agg

# 3. Apply the standard deviation function to the data aggregation you
# have just done

agg = aggregate(airquality$Solar.R, by = list(Month = airquality$Month), FUN = sd, na.rm=T)
agg

aggregate(Solar.R~Month,airquality, FUN=mean,na.rm=T)


# Exercise 6 – Writing a Function
# 1. Write a function to calculate the hypotenuse of a triangle given the length of the 2
# sides.
# Remember the hypotenuse is the square root of the sum of the squares - √(a² + b²)
# Run the function you have created with different values.

calculate_hypotenuse <- function(x, y) {
  hypotenuse <- sqrt(x^2 + y^2)
  return(hypotenuse)
}

calculate_hypotenuse(x = 2, y = 3)


# Exercise 7 - apply
# 1. Create a numeric vector of length 10. Write an lapply and sapply
# statement to square each element. Compare the two outputs.
# 2. Generate a list of length 4 containing both numeric and logical (T/F)
# vectors. Write an lapply or sapply statement to calculate the sum of
# the elements in each vector.
# 3. Write an sapply statement to repeat each element of each vector in
# your list three times e.g. 1, 4, 3 would become 1, 1, 1, 4, 4, 4, 3, 3, 3.
# Assign the output to a new list




# Exercise 8 - Loops
# 1. Write a for loop that iterates over the numbers 1 to 7 and prints the
# cube of each number using print().

#General structure of a loop
for(i in 1:7) {
  print(i^3)
  
}

# 2. Write a for loop that iterates over the column names of the inbuilt
# iris dataset and print each together with the number of characters
# in the column name in parenthesis.
# Example output: Sepal.Length (12).


colnames(iris)

iris_cols <- c()
for (i in colnames(iris)){
  print(paste0(i, " (", nchar(i), ")"))
  
}


# Use the functions print(), paste0() and nchar(). Look up what these
# functions do using the help feature.


# 3. Write an ifelse loop to print the colours in colours_vector with four
# characters. Use nchar()
# colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")

colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")

ifelse(nchar(colours_vector)==4, colours_vector, "NA")


#bashrc commands
#/home/you/git/obds_Oct_2022/your/files