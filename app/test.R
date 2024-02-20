source('functions.R')

data_versions <- as.data.table(data_version_names())

data_versions
versions <- data_versions[, "versions"]
years <- data_versions[, "years"]