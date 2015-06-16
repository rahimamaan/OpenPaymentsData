Identified_HighestPaidPerCity <- function (file = "CA_GeneralPayments.csv", city) {
	readfile <- readFileforCity(file, city)
	namedSet <- readfile[!is.na(readfile$Physician_Profile_ID),]
	namedSet_ <- aggregate(namedSet$Total_Amount_of_Payment_USDollars ~ namedSet$Physician_Profile_ID, namedSet, sum)
	colnames(namedSet_) <- c("Profile_ID", "Payment")
	namedSetMax <- as.numeric(max(namedSet_$Payment))
	profile_id <- namedSet_$Profile_ID[namedSet_$Payment == namedSetMax]
	profile_id <- round(as.numeric(profile_id), 0)
	first_name <- namedSet$Physician_First_Name[namedSet$Physician_Profile_ID == profile_id][1]
	last_name <- namedSet$Physician_Last_Name[namedSet$Physician_Profile_ID == profile_id][1]
	cat(as.character(first_name), as.character(last_name), ",", paste("$",format(namedSetMax, big.mark=","), sep=""))
}
