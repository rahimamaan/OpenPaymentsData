totalNumPaymentsPerCity <- function(file="CA_GeneralPayments.csv", city) {
	readfile <- read.csv(file)
	readfile <- readfile[readfile$Recipient_City == city,]
	readfileCap <- readfile[readfile$Recipient_City == toupper(city),]
	totalNum <- sum(readfile$Number_of_Payments_Included_in_Total_Amount) + sum(readfileCap$Number_of_Payments_Included_in_Total_Amount)
	totalDollarAmt <- sum(readfile$Total_Amount_of_Payment_USDollars) + sum(readfileCap$Total_Amount_of_Payment_USDollars)
	print(totalDollarAmt)
	totalDollarAmt <- paste("$", format(round(totalDollarAmt,2),nsmall=2), sep="")
	cat("In the city of", city, "pharmaceutical drug companies made" totalNum, "payments to " nrow(readfile) + nrow(readfileCap), ",totaling ", totalDollarAmt)
	
	
}