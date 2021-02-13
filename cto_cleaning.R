# Taking ODK Excel file and outputting in a table

library(readxl)
library(tidyverse)
library(rmarkdown)

# Data loading

here::here()
s = read_excel("CTO_to_word_test.xlsx", sheet = "reference")
c = read_excel("CTO_to_word_test.xlsx", sheet = "choices")
s = s %>% select(type, name, ID, label, hint, constraint, relevance) %>%
  filter(is.na(label) == F) %>%
  mutate(label = paste(ID, label, sep=" ")) %>%
  select(-ID)
c = c %>% select(list_name, name, label)

cto_to_word = function(index) {
  choice_lookup = strsplit(s$type[index]," ")[[1]][2]
  choice_list = list()
  indices = which(c$list_name %in% choice_lookup)
  p = list(c$label[indices])
  attach(s)
  text = paste(paste(label[index], name[index], sep = " - "), ifelse(is.na(hint[index])==T,"",hint[index]),
               paste(ifelse(is.na(constraint[index]==T),"",constraint[index]),
                     ifelse(is.na(relevance[index])==T,"",relevance[index]),
                     sep = " "), sep = "\n")
  detach(s)
  for (j in 1:length(p[[1]])){
    choice_list = paste(choice_list, p[[1]][j], sep = "\n")
  }
  text = paste(text, choice_list, "", sep = "\n")
  # return(cat(text))
  # trying to add this to a massive list, just returning text
  return(text)
}


output = ""
for (i in 1:nrow(s)){
  output = paste("", output, cto_to_word(i), sep = "\n")
}
cat(output)
