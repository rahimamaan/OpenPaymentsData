readFileforCity <- function(file = "CA_GeneralPayments.csv", city) {
	readfile <- read.csv(file)
	readfile <- readfile[readfile$Recipient_City == city,]
	return(readfile)
}