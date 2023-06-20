# Download all the 10k filling for companies in dow jones index


install.packages("edgar")
install.packages("dowjones")
library(edgar)
library(dowjones)

# Set the desired working directory
setwd("path/to/directory")

# Specify the email address to use for the API call
email_address <- "test@trester.com"

# Fetch the companies in the Dow Jones Industrial Average
dowjones_companies <- dowjones::dji_components()

# Extract the CIK numbers from the company data
cik_numbers <- dowjones_companies$cik

# Specify the filing years
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
