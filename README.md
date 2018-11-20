# SCBI-Plot-Book
Repository for ForestGEO-SCBI plot book. 

## Organization

- Chapters: Each chapter is represented by its own, numbered .Rmd file, and this is where editing takes place. Instructions on how to do this are below. Chapters are in numerical order, so 01-Introduction = Chapter 1: Introduction.

- [\_book folder](https://github.com/SCBI-ForestGEO/SCBI-Plot-Book/tree/master/_book): This is where the html (web) files of the book are stored when R renders the .Rmd files together.

- All other files: Other files including .yml and .bib are important for the overall structure of the book in the R code.

## How to Edit Chapters

*This assumes you are working in the context of local files via Github desktop*

Each chapter is separated into a different Rmarkdown (.Rmd) file. Opening this will open it to an R-console, from where you can add and edit data, before reviewing how it looks on html.

1. Open the .Rmd you want to work on (make sure to fetch origin first from Github desktop!).

2. Edit the file and save.

3. To preview what it will look like online, you need to update the html files.

4. In R, install the bookdown package and set working directory to be the github local path.
     
       install.packages("bookdown")
       library(bookdown)
       setwd("localpath/Github/SCBI-Plot-Book")

5. Now, run the command to put the book together (known as "rendering").

       bookdown::render_book("index.Rmd")

6. Your ouput will look something like this:

       processing file: _main.Rmd
        |.................................................................| 100%
        ordinary text without R code
       output file: _main.knit.md

       "C:/Program Files/RStudio/bin/pandoc/pandoc" +RTS -K512m -RTS _main.utf8.md --to html4 --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output _main.html --smart --email-obfuscation none --standalone --section-divs --table-of-contents --toc-depth 3 --template "C:\Users\mcgregori\Documents\R\win-library\3.5\bookdown\templates\gitbook.html" --highlight-style pygments --number-sections --css style.css --include-in-header "C:\Users\MCGREG~1\AppData\Local\Temp\14\Rtmp8WwPNp\rmarkdown-str397c787bde.html" --mathjax --filter pandoc-citeproc 

       Output created: _book/introduction.html
       [1] "localpath/Github/SCBI-Plot-Book/_book/introduction.html"
       Warning message:
       In split_chapters(output, gitbook_page, number_sections, split_by,  :
          You have 7 Rmd input file(s) but only 6 first-level heading(s). Did you forget first-level headings in certain Rmd files?

7. The important part is "Output created." This means the html files have been updated and are in the \_book folder. The warning message refers to the lack of a header (H1 #) in the index.Rmd. This is fine.

8. Open the html file associated with your edited chapter and review how it looks.

10. When finished, please remember to commit and push back to Github. When pushing after doing the rendering command, you'll notice there are several changed files that have a .css, .js, and .json extensions. These refer to the elements of the web visualization and as such are necessary to be pushed as well.

## Resources

Save [ideas](https://github.com/SCBI-ForestGEO/SCBI-Plot-Book/blob/master/ideas.md), scripts for mapping, chapters, references, etc

[Use this](https://bookdown.org/yihui/bookdown/) as the main reference to write a book using bookdown

[This guide](https://bookdown.org/yihui/rmarkdown/) is great to understand the technical details behind a bookdown 'book'

[Here](https://github.com/dr-harper/rmarkdown-cookbook) is an example of book in progress using Rmarkdown.

[Here](https://github.com/forestgeo/fgeo.tool) are guidelines for the `fgeo` R package from Mauro that we will use to build species maps, summarize species demography, etc.. 
