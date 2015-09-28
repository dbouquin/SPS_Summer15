library(ggplot2)
diamonds10 <- diamonds[1:10,]
diamonds10

# I would like to run a for loop that will write csv files containing mean price data of diamonds grouped by cut. 
# I would like a single csv file for each cut 

for (i in 1:length(diamonds10$price))  {
  aggregate(i, by=list(diamonds10$cut), FUN=mean)
  filename <-  paste(diamonds10$cut,"csv", sep = ".")
  write.csv(i, filename)
}


          