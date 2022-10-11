#Activity 4
bed_file <- read.table('/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", header=F, sep="\t')

dim(bed_file)
class(bed_file)
nrow(bed_file)
ncol(bed_file)
head(bed_file)
colnames(bed_file) <- c("chr", "start", "stop", "name", "score", "strand")

# 1. Load the coding_gene_region.bed into R.
# /project/obds/shared/resources/2_r/baseR/coding_gene_region.bed
# 2. Check the dimensions of the dataframe and the class of each variable.
# How many rows and columns are there in this dataframe?
# 3. Add column names. The columns are:
# "chr", "start", "stop", "name", "score", "strand"
# 4. Display the new columns names.
names(bed_file)

# 5. Extract the element at row 30, column 3

bed_file[30,3]

# 6. Extract the second column by index and by name (using both [ ] and $ ), assign
# these to new variables

col_2 <- bed_file[,2]
col_2
col_2b <- bed_file$start
col_2b

# 7. Calculate the intervals (start-stop) and add them as a new column called int_length.

bed_file$int_length <- bed_file$stop - bed_file$start
colnames(bed_file)
head(bed_file)

# What is a quick way to check you have added this column?


# 8. Subset the data frame to contain only regions with a length from 100,001-200,000 bp
# - assign to a new variable.

bed_subset <- bed_file[bed_file$int_length >= 100001 & bed_file$int_length <= 200000,]

# 9. Write your subsetdata frame to a tab separated file ie (include column names but not
# rownames).

write.table(bed_subset, "intervals_100kto200k.txt", sep="\t", quote = F, row.names = F)
