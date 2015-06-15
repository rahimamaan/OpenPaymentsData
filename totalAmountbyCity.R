totalAmountbyCity <- function(file, city) {
	readfile <- read.csv(file)
	readfile <- subset(readfile, Recipient_City == city)
	readfile_2 <- subset(readfile, Recipient_City == toupper(city))
	totalAmount <- sum(readfile$Total_Amount_of_Payment_USDollars, na.rm=TRUE) + sum(readfile_2$Total_Amount_of_Payment_USDollars)
	return(totalAmount)
}