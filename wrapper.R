# Import libraries
library(rmarkdown)
library(data.table)
library(shiny)


# Import functions 
source("helpers/Functions.R")


##############################################################
# Input parameters for the automatic .Rmd file 
# Set values 
##############################################################
# #Recovery Datensatz
# filename <- "recovery.csv"
# decimal <- "."
# fencoding<-"UTF-8"
# data <- fread(filename, header = "auto", sep ="auto", dec = decimal,
#               encoding ="UTF-8", data.table = FALSE, na.strings = "")
# ## Selection of variables
# vars1 <- c("blanket", "minutes")
# # Model Information
# model <- "minutes ~ blanket \n blanket \n b0"
# ## Criterium to identify continuous vs discrete variables
# cont_crit <- "Liberal" # or Conservative 

###Thuesen Datensatz

#install.packages("ISwR")
library(ISwR)
data("thuesen", package="ISwR")
write.csv(thuesen, file = "thuesen.csv", na="NA")
#data<-thuesen
filename <- "thuesen.csv"
decimal <- "."
fencoding<-"UTF-8"
vars1 <- c("blood.glucose", "short.velocity")
model <- "blood.glucose ~ short.velocity \n short.velocity \n 1.7"
data <- fread(filename, header = "auto", sep ="auto", dec = decimal,
  encoding ="UTF-8", data.table = FALSE, na.strings = "NA")
cont_crit <- "Conservative" # or Conservative or Liberal

##############################################################
# Run parametric, automatic .Rmd file 
##############################################################
rmarkdown::render("report.Rmd", params = list(
  filename = filename,
  decimal = decimal,
  fencoding = fencoding,
  data = data,
  vars1 = vars1,
  model = model,
  cont_crit = cont_crit 
))

############################################## end of program ########################################################################





