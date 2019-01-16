library(dplyr) # load dypr into library

data <- read.csv("FallopiaData.csv") #load data
str(data)

data <- filter(data, Total > 60) # remove rows with total biomass < 60
head(data) # check

df <- arrange(data, Total, Taxon, Scenario, Nutrients) # reorder columns
df <- select(df, Total, Taxon, Scenario, Nutrients) # remove all other columns
head(df) # check

df <- mutate(df, Total = Total/1000) # convert total biomass from mg to g
df <- rename(df, TotalG = Total) # rename Total colum to TotalG
head(df) # check


df$Nutrients <- gsub("(\\w)\\w+","\\1", df$Nutrients) # replace each word with its first letter
head(df) #check

df$TotalG <- gsub("\\.",",", df$TotalG) # replace all periods with commas
head (df) #check