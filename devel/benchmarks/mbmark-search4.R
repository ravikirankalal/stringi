benchmark_description <- "finds a word at the beginning of a long string (Latin&Polish letters)"

benchmark_do <- function() {
   library('stringi')
   library('stringr')

   str <- enc2native(str_join(str_dup("kaw\u0105", 100000), "law\u0105"))
   firstword <- enc2native("kaw\u0105")

   gc(reset=TRUE)
   microbenchmark2(
      stri_detect_regex(str, firstword),
      stri_detect_regex(str, firstword, list(literal=TRUE)),
      stri_detect_fixed(str, firstword),
      stri_detect_coll(str, firstword),
      grepl(firstword, str),
      grepl(firstword, str, perl=TRUE),
      grepl(firstword, str, fixed=TRUE)
   )
}
