## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE---------------------------------------------------
library(annotater)

## -----------------------------------------------------------------------------
pkgs_string <- c("library(boot)\nrequire(Matrix)")
match_pkg_names(pkgs_string)

## -----------------------------------------------------------------------------
pkgs_string <- c("library(boot)\nrequire(tools)")
annotate_pkg_calls(pkgs_string)

## -----------------------------------------------------------------------------
pkgs_string <- c("library(knitr)\nrequire(datasets)")
annotate_repo_source(pkgs_string)

## -----------------------------------------------------------------------------
pkgs_string <- c("library(rlang)\nrequire(datasets)")
annotate_repostitle(pkgs_string)

## -----------------------------------------------------------------------------
testcode <- c('library(purrr) 
x <- list("a", 1, c("bo","bi","bu"))
pluck(x, 1)
map(x, pluck, 2)')
annotate_fun_calls(testcode)

## -----------------------------------------------------------------------------
testcode <- c('library(tidyr) 
summary(household)
plot(fish_encounters)')
annotate_pkg_datasets(testcode)

