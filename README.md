# renamer

A simple CLI tool for renaming images to their SHA-1 checksum.

## Features

- Rename image files with extensions: `.jpeg`, `.jpg`, `.png`
- Outputs the original and new file names.

## Usage

In R:

```r
renamer::sha1("/path/to/your/image/directory")
```

From terminal:

```sh
Rscript main.R /path/to/your/image/directory
```

## Example

```r
> renamer::sha1("~/Pictures/Wallpapers")

[1] "test_1.png -> 5f5c1bc8504ed57dbdeae216a71563e745a14e16.png"
[1] "test_2.jpg -> 7669e1dcaad7866d5c00f5f03b58181d3c75cdec.jpg"
```

```sh
> Rscript src/renamer.R ~/Pictures/Wallpapers

[1] "test_1.png -> 5f5c1bc8504ed57dbdeae216a71563e745a14e16.png"
[1] "test_2.jpg -> 7669e1dcaad7866d5c00f5f03b58181d3c75cdec.jpg"
```
