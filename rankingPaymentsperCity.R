rankingPaymentsperCity <- function (file = "CA_GeneralPayments.csv", city) {
	readfile <- readFileforCity(file, city)
	readfile <- readfile[!is.na(readfile$Physician_Profile_ID),]
	to_keep <- c("Physician_First_Name", "Physician_Last_Name", "Total_Amount_of_Payment_USDollars") 
	returnFile <- subset(readfile, select=to_keep)
	returnFile <- returnFile[order(-returnFile$Total_Amount_of_Payment_USDollars),]
	return (returnFile)
}