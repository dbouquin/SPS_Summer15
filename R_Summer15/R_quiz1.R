R Quiz 1

# 1. Create a vector that contains 20 numbers. 
# (You may choose whatever numbers you like, but make sure there are some duplicates.)

v1 <- c(1:10, rep(c(1:5),each=2))
v1
length(v1)

# 2. Use R to convert the vector from question 1 into a character vector.

char_v1 <- as.character(v1)

# 3. Use R to convert the vector from question 1 into a vector of factors.

fac_v1 <- as.factor(v1)

# 4. Use R to show how many levels the vector in the previous question has

levels(fac_v1)
nlevels(fac_v1)

# 5. Use R to create a vector that takes the vector from question 1 and 
# performs on it the formula 3x^2 - 4x + 1

quad_v1 <- 3 * (v1^2) - 4 * v1 + 1

# 6. Create a named list. That is, create a list with several elements 
# that are each able to be referenced by name

named_l1 <- list(Grade = 100, Name = "Daina Bouquin", Assignment = "R Quiz 1")
names(named_l1)

# 7. Create a data frame with four columns – one each character, factor (with three levels),
# numeric, and date. Your data frame should have at least 10 observations (rows).

sports <- as.character(c("swimming", "rowing", "basketball", "hockey", "tennis", "baseball", "football", "soccer", 
                         "lifting", "rugby", "cricket", "polo", "volleyball", "diving", "running"))
f_numbers <- as.factor(rep(c(1:3),each=5))
o_numbers <- as.numeric(c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,29))
bdays <- as.Date(c("2013-07-01", "2013-07-02", "2013-07-03", "2013-07-04", "2013-07-05", "2013-07-06", "2013-07-07", 
                   "2013-07-08", "2013-07-09", "2013-07-10", "2013-07-11", "2013-07-12", "2013-07-13", "2013-07-14", 
                   "2013-07-15"))

aDF <- data.frame(Sports = sports, Numbers = f_numbers, OddNumbers = o_numbers, Birthdays = bdays)
str(aDF)

# 8. Illustrate how to add a row with a value for the factor column that isn’t already in the list of levels. 
# (Note: You do not need to accomplish this with a single line of code.)

# Add the following to the df: "biking", 9, 31, "2013-07-16"

new_aDF <- data.frame(Sports="biking", Numbers=9, OddNumbers=31, Birthdays= "2013-07-16")
str(new_aDF)

new_aDF$Sports <- as.character(new_aDF$Sports)
new_aDF$Numbers <- as.factor(new_aDF$Numbers)
new_aDF$OddNumbers <- as.numeric(new_aDF$OddNumbers)
new_aDF$Birthdays <- as.Date(new_aDF$Birthdays)

str(new_aDF)

aDF_plus <- rbind(aDF, new_aDF)
aDF_plus

str(aDF_plus)

# 9. Show the code that would read in a CSV file called temperatures.csv
# from the current working directory.

temps <- read.csv("temperatures.csv")

#10. Use a loop to calculate the final balance, rounded to the nearest cent,
# in an account that earns 3.24% interest compounded monthly after six years
# if the original balance is $1,500.

# A = P(1+r/n)^nt 

princ <- 1500 #A
annual_interest <- 0.0324 #P
compound_p_yr <- 12 #n
yrs <- 6 #t

# without a loop: 
# A <- princ*(1+annual_interest/compound_p_yr)^(12*yrs)

for (A in 1:(compound_p_yr*yrs))
{
  princ <- princ + (princ * annual_interest / compound_p_yr)
}
princ # prints 1821.396
sprintf("%.2f", princ)

# 11. Create a numeric vector of length 20 and then write code to calculate the sum of 
# every third element of the vector you have created.

numVec <- 1:20
sum(numVec[seq(3,length(numVec),3)]) # seq(from=3, to=length of the vector, by=3)

# 12. Use a for loop to calculate sum of i = 1 to 10 of x^i for the value = 2

x <- 2
sum <- 0
for (i in 1:10)
{
  sum <- sum + x ^ i
}
sum

# 13. Use a while loop to accomplish the same task as in the previous exercise
x <- 2
sum <- 0
i <- 1

while (i <= 10)
{
  sum <- sum + x ^ i
  i <- i + 1
}
sum

# 14. Solve the problem from the previous two exercises without using a loop.

x <- 2
i <- 1:10
sum(x^i)  #so much simpler

