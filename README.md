
<!-- README.md is generated from README.Rmd. Please edit that file -->

# annotater

<img src='man/figures/logo.png' align="right" height="210" />

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/luisDVA/annotater/branch/master/graph/badge.svg)](https://app.codecov.io/gh/luisDVA/annotater?branch=master)  
<!-- badges: end -->

The goal of `annotater` is to annotate package load calls in character
strings and R/Rmd files, so we can have an idea of the overall purpose
of the libraries we’re loading.

### What do my loaded packages do?

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/annotcalls.gif' align="center" width="400px" />

### Where did I get them?

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/repos2.gif' align="center" width="400px" />

------------------------------------------------------------------------

The two annotation types are also available together:

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/repostitles.gif' align="center" width="400px" />

Thanks to [Juan Cruz Rodriguez](https://github.com/jcrodriguez1989), we
can now annotate which functions from each package are being called in a
script.

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/jcruz.gif' align="center" width="400px" />

## `pacman` compatibility

Users of the [`pacman`](https://cran.r-project.org/package=pacman)
package can now use all `annotater` functions on `p_load` calls. This
includes calls with multiple package names
(e.g. `p_load(ggplot2,purrr)`), which will be split up across lines for
readability.

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/annotpacmanFns.gif' align="center" width="400px" />

<img src='https://raw.githubusercontent.com/luisdva/annotater/master/inst/media/annotpacmanRepos.gif' align="center" width="400px" />

## Installation

Install the development version of `annotater` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("luisDVA/annotater")
```

Restart RStudio after the installation for the addins to load properly.

### When using the addins, make sure the focus (blinking cursor) is on an open RStudio R file in the ‘source’ pane.

## Example

These are the possible annotations, which can be added to character
strings (with one line per element), or applied to .R or .Rmd files in
RStudio through their corresponding addins.

``` r
library(annotater)
test_string <-c("library(boot)\nrequire(Matrix)")
writeLines(annotate_pkg_calls(test_string))
writeLines(annotate_repo_source(test_string))
writeLines(annotate_repo_source(test_string))
```

Entire .R files can also be parsed and annotated with the
`annotate_script` function.

### A note on the `tidyverse`

The `tidyverse` package is a meta-package with few exported functions of
its own, so the annotation tools provided here (`annotate_fun_calls`)
will not match the functions from the various individual packages (such
as `dplyr` or `readr`) that get attached when loading `tidyverse`. This
is by design, so consider loading individual packages if annotations for
function calls are desired.

Feedback welcome

Thanks to [Jonathan Carroll](https://github.com/jonocarroll), [Fırat
Melih Yılmaz](https://twitter.com/fratmelhylmaz), and [Achaz von
Hardenberg](https://github.com/achazhardenberg) for feedback and
suggestions.
