
# read the file
getwd()
setwd("C:/Users/utpala mohapatra/OneDrive/Documents/r files")
walmart_data = read.csv('Walmart_Store_sales.csv')
View(walmart_data)

#Which store has maximum sales

# step 1: use aggregate function to find total sales
total_sales = aggregate(Weekly_Sales~Store,walmart_data,FUN=sum)
total_sales

#Find store with max Sales
total_sales_sort = arrange(total_sales,desc( Weekly_Sales))
total_sales_sort
print(paste('The Store with maximum sales is :',total_sales_sort[1,1]))

install.packages('dplyr')
library(dplyr)
#Which store has maximum standard deviation i.e., the sales vary a lot. Also, find out the coefficient of mean to standard deviation
STD_sales = summarise(group_by(walmart_data,Store),sd(Weekly_Sales))
STD_sales

#arrange  function
STD_sales_sort = arrange(STD_sales,desc(`sd(Weekly_Sales)`))
STD_sales_sort
print(paste("The store with highest Standard Deviation is Store ",STD_sales_sort[1,1]))



