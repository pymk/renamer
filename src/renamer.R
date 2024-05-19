if (!requireNamespace("argparse", quietly = TRUE)) {
  install.packages("argparse")
}

library(argparse)

parser <- ArgumentParser(description = "Rename files to their SHA-1 checksum")

parser$add_argument(
  "path",
  type = "character",
  help = "The directory path to the files"
)

args <- parser$parse_args()
dir_path <- args$path

files_full_path <- list.files(
  path = dir_path,
  pattern = "\\.jpg$|\\.JPG|\\.jpeg$|\\.JPEG$|\\.png$|\\.PNG$",
  full.names = TRUE,
  recursive = FALSE
)

for (i in seq_along(files_full_path)) {
  old_name <- files_full_path[i]
  ext <- tools::file_ext(old_name)
  sha <- digest::sha1(old_name)
  new_name <- paste0(sha, ".", ext)
  new_name_full_path <- file.path(dir_path, new_name)
  file.rename(old_name, new_name_full_path)
  print(paste0(basename(old_name), " -> ", basename(new_name)))
}
