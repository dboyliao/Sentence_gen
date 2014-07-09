set.seed(1)

PUNCTUATION = c(',', ':', '.', ';')

lyrics <- scan('~/Desktop/bad_romance.txt', what ='character', sep='')
lyrics <- gsub(',', '', lyrics)

words <- list()
for (word in lyrics){
  if (!word %in% words){
    words <- c(words, list(word))
  }
}

transition <- list()
for (i in 1:length(words)){
  transition[[i]] <- c('end')
}
names(transition) <- words

for (i in 1:(length(lyrics)-1)){
  word <- lyrics[i]
  transition[[word]] <- c(transition[[word]], list(lyrics[i+1]))
}

result = ''
word <- sample(names(transition), 1)
word <- word[[sample(length(word), 1)]]
while (T){
  if (word == 'end'){
    break
  } else {
    punct <- sample(PUNCTUATION, 1)
    result <- paste(result, word, sep = punct)
    word <- transition[[word]]
    word <- word[[sample(length(word), 1)]]
  }
}
