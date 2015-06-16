largestTeachingHospitals <- function (file = "CA_GeneralPayments.csv", city) {
	readfile <- readFileforCity(file, city)
	readfile <- readfile[readfile$Teaching_Hospital_Name != "",]
	aggFile <- aggregate(readfile$Total_Amount_of_Payment_USDollars ~ readfile$Teaching_Hospital_Name, readfile, sum)
	colnames(aggFile) <- c("Teaching_Hospital", "Total_Amount_of_Payment_USDollars")
	largestTeachingHosp <- aggFile$Teaching_Hospital[aggFile$Total_Amount_of_Payment_USDollars == max(aggFile$Total_Amount_of_Payment_USDollars)]
	dollarAmt <- format(round(max(aggFile$Total_Amount_of_Payment_USDollars),2), nsmall=2)
	dollarAmt <- paste("$", dollarAmt, ".", sep="")
	cat("The teaching hospital/organization that received the most amount of payments in the city of", city, "is", as.character(largestTeachingHosp), "with", dollarAmt) 
}