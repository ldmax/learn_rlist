library(rlist)
library(pipeR)

url <- "https://renkun-ken.github.io/rlist-tutorial/data/people.json"
people <- list.load(url)
people %>>%
  list.filter(Expertise$R >= 1 & Expertise$Python >= 1) %>>%
  list.class(Interests) %>>%
  list.sort(-length(.)) %>>%
  list.take(3) %>>%
  list.map(. %>>% list.table(Age))
