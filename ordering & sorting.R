# Create a data frame
x <- data.frame("col1" = sample(1:5), "col2" = sample(6:10), "col3" = sample(11:15))

#dearrange the sequence
x <- x[sample(1:5),];x$col2[c(1,3)] = NA
x
#subset row 1
x[1,]

#Subset column 1
x[,1]

#subset colum using variable name
x[,"col2"]

#subset row 1&2 of variable 2
x[1:2,"col2"]
x[4,"col2"]


#subset column 2&3
x[,2:3]

#subset data for varibale one is less than to equal to 3
x[(x$col1 <=3),]

#subset data for varibale one is less than to equal to 3 & variable 3 greater than 12
x[(x$col1 <=5 & x$col3 >12),]

#subset data for varibale one is less than to equal to 3 or variable 3 greater than 12
x[(x$col1 <=3 | x$col3 >12),]

#Exclude 8- subset data for varibale 2 is greater than 8 and exclude NA
x[which(x$col2 >8),]

# sort variable in ascending order 
sort(x$col1)

# sort variable in descending order 
sort(x$col1, decreasing = T)

# sort variable in descending order and place NA at last
sort(x$col2, decreasing = T, na.last = T)

# order
x[order(x$col1),]

# order multiple column
x[order(x$col1,x$col3),]

#arrange only variable one in increasing order and keep rest of them in respective order
arrange(x,x$col1)

#arrange only variable one in decreasing order and keep rest of them in respective order
arrange(x,desc(x$col3))


# add rows & columns
x$col4 <- rnorm(5)

# add rows & columns using r & c bind
x <- cbind(x, rnorm(5)) #adds a column next to the last column of x with 5 normal random numbers
x<-rbind(x, rnorm(5))  #adds a row below the last row of x with 5 normal random numbers
x


#summarize data
# get working directory

getwd()
setwd("C:/Users/v-vxpandey/Desktop/Getting-Sorting-data/data1")

# create directoty if folder do not exists
if(!file.exists("/data")){dir.create("./data1")}

#Download and read csv file
url1<- "https://opendata.arcgis.com/datasets/53319332a909407e8ee52ae8ea79663d_0.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D"
download.file(url1, destfile = "./balticity.csv")

file1 <- read.csv("./balticity.csv")

# read first 3 and last 3 lines of data
head(file1, n =3)
tail(file1, n =3)

# summary of data
summary(file1)

#details
str(file1)

#to check the quantile of a avarible, 0% shows the lowest # where as 100% shows highest
quantile(file1$plcdst_no,na.rm = T)

quantile(file1$plcdst_no, probs = c(0.1,0.5,0.75), na.rm = T)

#to show a particular data(zipcode) in table format and useNA will tell details of missing value
table(file1$zipcode, useNA = "ifany")

#table with two dimensions 
table(file1$zipcode,file1$loc_type)
table(file1$city, file1$zipcode)

#shows if any missing value in data True = missing value, false = no missing value or NA
is.na(file1$zipcode)

#shows if any missing value in data as sum
# 1= yes missing value, 0 = No missing value
sum(is.na(file1$zipcode))

#shows if any missing value in data as sum
# True= yes missing value, False = No missing value
any(is.na(file1$zipcode))

#checks if data is fulfilling the criteria (here if zipcode is smaller than 0)
#True = yes criteria fulfilled, NO = not fulfilled
all(file1$zipcode<0)

#sums all the columns WITH Other criteria checks (here is.na)

colSums(is.na(file1))

# sum all rows
rowsum(file1)

#shows if there are any missing value in the data
all(colSums(is.na(file1)) == 0)

# to check how many times a criteria is available in the data
# to find specific characteristic in the data
table(file1$zipcode == "21212")
table(file1$zipcode %in% c("21212"))

table(file1$zipcode %in% c("21212","21213"))


file1[file1$zipcode %in% c("21212","21213"),]
z
