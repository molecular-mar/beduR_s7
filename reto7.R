#Jalando la DB
MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListFields(MyDataBase, 'CountryLanguage')

CountryLT <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
CountryLT2 <- dbGetQuery(MyDataBase, "select * from CountryLanguage where Language='Spanish'")

spanishPercent <- CountryLT %>% filter(Language=="Spanish")
head(spanishPercent)
head(CountryLT2)

install.packages("ggplot2")
library(ggplot2)

ggplot(CountryLT2, aes(Percentage, CountryCode, color = IsOfficial)) +
  geom_point() 


  