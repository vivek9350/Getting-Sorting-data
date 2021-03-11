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
