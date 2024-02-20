library(data.table)

data_versions_names <- function() { 
  files_available <- list.files('../data/')
  file_input_dt <- data.table("versions" = character(), "years" = list())
  for (file in files_available) {
    file <- strsplit(file, "_")[[1]]
    hes_efu <- paste0(file[2], ", ", file[3])
    year <- paste0("20", substr(file[4], 3, 4))
    if (nrow(file_input_dt[versions %like% hes_efu]) == 0) {
      file_input_dt <- rbindlist(list(file_input_dt, data.table("versions" = hes_efu, "years" = list())))
    }
    file_input_dt[versions == hes_efu, "years" := list(c(years[[1]], year))]
  }
  return(file_input_dt)
}

data_versions_lists <- function() { 
  files_available <- list.files('../data/')
  file_list <- list()
  for (file in files_available) {
    file_split <- strsplit(file, "_")[[1]]
    hes_efu <- paste0(file_split[2], ", ", file_split[3])
    year <- paste0("20", substr(file_split[4], 3, 4))
    file_list[[hes_efu]] <- c(file_list[[hes_efu]], file)
    names(file_list[[hes_efu]])[length(file_list[[hes_efu]])] <- year
  }
  return(file_list)
}

lister <- data_versions_lists()

lister

tryme <- function() { 
  files_available <- list.files('../data/')
  file_input_dt <- data.table()
  for (file in files_available) {
    file <- strsplit(file, "_")[[1]]
    hes_efu <- paste0(file[2], ", ", file[3])
    year <- paste0("20", substr(file[4], 3, 4))
    file_input_dt[, (hes_efu) := year]
  }
  return(file_input_dt)
}

test <- tryme()

