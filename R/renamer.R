#' Rename Files to Their SHA-1 Checksum
#'
#' This function renames all files in the specified directory to their
#' SHA-1 checksum followed by their original file extension. It only
#' processes files with the extensions `.jpg`, `.jpeg`, and `.png`.
#'
#' @param path A character string specifying the path to the directory
#' containing the files. Defaults to the current working directory.
#' @return None
#' @examples
#' \dontrun{
#' rename("/path/to/your/directory")
#' }
#' @export
sha1 <- function(path = ".") {
  files_full_path <- list.files(
    path = path,
    pattern = "\\.jpg$|\\.JPG|\\.jpeg$|\\.JPEG$|\\.png$|\\.PNG$",
    full.names = TRUE,
    recursive = FALSE
  )

  for (i in seq_along(files_full_path)) {
    old_name <- files_full_path[i]
    ext <- tools::file_ext(old_name)
    sha <- digest::sha1(old_name)
    new_name <- paste0(sha, ".", ext)
    new_name_full_path <- file.path(path, new_name)
    file.rename(old_name, new_name_full_path)
    print(paste0(basename(old_name), " -> ", basename(new_name)))
  }
}
