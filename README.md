
Retrieve 10-K Filings from Edgar Website

This project retrieves 10-K filings from the Edgar website for all the companies in the S&P 500 for the years 2011 to 2022. The code is written in R and uses the quantmod and edgar packages.

#Getting Started
To get started, clone this repository to your local machine. Then, install the quantmod and edgar packages.

install.packages("quantmod")
install.packages("edgar")

source("retrieve_10k_filings.R")

This will download the 10-K filings for all the companies in the S&P 500 for the years 20XX to 20XX and save them to a file called cik_year.rds, where cik is the company's CIK number and year is the year of the filing.



##Data
The data is stored in a file called cik_year.rds. This file is a compressed R data file and can be loaded into R using the loadRDS() function.


##Analysis
The data can be analyzed using a variety of R packages. For example, the dplyr package can be used to clean and transform the data, and the ggplot2 package can be used to visualize the data.


##Contributing
If you would like to contribute to this project, please fork the repository and submit a pull request.


##License
This project is licensed under the MIT License. -->


Acknowledgments
This project utilizes the following open-source libraries and resources:

[edgarWebR](https://github.com/mwaldstein/edgarWebR): An R package for interacting with the SEC's EDGAR filing search and retrieval system.

[edgar](https://github.com/Gunratan/edgar
): A tool for the U.S. SEC EDGAR retrieval and parsing of corporate filings.

We acknowledge the developers of these libraries for their contributions and making them available to the community.
