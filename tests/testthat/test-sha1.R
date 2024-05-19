testthat::test_that("rename function works correctly", {
  temp_dir <- tempdir()

  temp_files <- c("test1.jpg", "test2.png", "test3.jpeg", "test4.JPG")
  temp_file_paths <- file.path(temp_dir, temp_files)
  sapply(temp_file_paths, function(x) file.create(x))

  sha1(temp_dir)

  new_files <- list.files(
    path = temp_dir,
    pattern = "\\.jpg$|\\.jpeg$|\\.png$|\\.JPG$",
    full.names = TRUE
  )

  # Check if files have been renamed correctly
  testthat::expect_equal(length(new_files), length(temp_files))
  sapply(new_files, function(x) unlink(x))

  # Verify that the new file names match the expected SHA-1 hash format
  for (new_file in new_files) {
    ext <- tools::file_ext(new_file)
    testthat::expect_true(ext %in% c("jpg", "jpeg", "png", "JPG"))

    file_name <- basename(new_file)
    sha_part <- sub(paste0("\\.", ext), "", file_name)

    # SHA-1 hash is 40 characters long
    testthat::expect_equal(nchar(sha_part), 40)
  }
})
