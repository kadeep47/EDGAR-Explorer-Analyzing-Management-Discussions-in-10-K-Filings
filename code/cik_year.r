install.packages("edgar")
library(edgar)


# Get the current working directory
getwd()


setwd("path/to/directory") # Set the desired working directory


# Specify the email address to use for the API call
email_address <- "Test@trester.com"

# Specify the CIK numbers and filing years
cik_numbers <- c(34088, 93410, 1163165)
filing_years <- 2011:2022

# Iterate over each filing year
for (year in filing_years) {
    tryCatch(
        {
            # Make the API call to get the management disclosure
            mgmt_disclosure <- getMgmtDisc(cik.no = cik_numbers, filing.year = year, email_address)

            company_name <- dowjones_companies$name

            # Create the file name
            file_name <- paste0(company_name, "_", year, ".txt")

            # Save the management disclosure data to a file
            write.table(mgmt_disclosure, file = file_name, sep = "\t", quote = FALSE, row.names = FALSE)


            # Print a success message
            cat("Management disclosure obtained for", year, "\n")
        },
        error = function(e) {
            # Handle any errors that occur during the API call
            cat("Error occurred while obtaining management disclosure for", year, ": ", conditionMessage(e), "\n")
        }
    )
}
