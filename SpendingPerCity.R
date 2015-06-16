SpendingPerCity <- function(file = "CA_GeneralPayments.csv", Manufacturer_or_GPO, City) {
	readfile <- readFileforCity(file, City)
	readfile <- readfile[readfile$Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name != "",]
	aggData <- aggregate(readfile$Total_Amount_of_Payment_USDollars ~ readfile$Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name, readfile, sum)
	colnames(aggData) <- c("Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name", "Total_Amount_of_Payment_USDollars")
	totalSpending <- aggData$Total_Amount_of_Payment_USDollars[aggData$Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name == Manufacturer_or_GPO]
	if (length(totalSpending) == 0) {
		return("This manufacturer didn't make any payments to physicians in this city.")
	}
	else {
		return(as.numeric(totalSpending))
	}
	
}

