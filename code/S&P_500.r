# Download all the 10k filling for companies in s&p 500 index

# Install the quantmod and Edgar packages
install.packages("quantmod")
install.packages("edgar")

# Load the quantmod and Edgar packages
library(quantmod)
library(edgar)

# Get all the companies in the S&P 500
sp500 <- getSymbols("^GSPC")

# Download the 10-K filings for all the companies in the S&P 500
output <- lapply(sp500, getMgmtDisc, filing.year = 2011:2022, "Tbgert@trester.com")

# Save the 10-K filings to a file called cik_year.rds
for (i in 1:length(output)) {
  cik <- sp500$cik[i]
  year <- sp500$year[i]
  saveRDS(output[[i]], file = paste0(cik, "_", year, ".rds"))
}
