mostCommonSpecialty <- function (file = "CA_GeneralPayments.csv", city) {
	readfile <- readFileforCity(file, city)
	readfile <- readfile[readfile$Physician_Specialty != "",]
	aggFile <- aggregate(readfile$Number_of_Payments_Included_in_Total_Amount ~ readfile$Physician_Specialty, readfile, sum)
	colnames(aggFile) <- c("Physician_Specialty", "Number_of_Payments_Included_in_Total_Amount")
	mostCommonSpecialty <- aggFile$Physician_Specialty[aggFile$Number_of_Payments_Included_in_Total_Amount == max(aggFile$Number_of_Payments_Included_in_Total_Amount)]
	cat("The most common specialty in the city of", city, "is", as.character(mostCommonSpecialty))
	
}