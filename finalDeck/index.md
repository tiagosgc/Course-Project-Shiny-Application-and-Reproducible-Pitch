---
title       : Course Project final assignment
subtitle    : Shiny Application and Reproducible Pitch
author      : Tiago Carvalho
job         : 
framework   : shower        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Guess the number

My assignment is not an analysis _per se_, but I hope it is fun to try out

--- .class #id 

## Summary

In this interface you're playing a game of guessing a random generated number between 1 and 100

---

## Why 7 tries?

If you eliminate half of the possible numbers in each try, you should always be able to guess in 7 tries


---

## Some code to demonstrate my point


```r
n<-100
i<-c(1,2,3,4,5,6,7)
for (val in i) {
    n <- ceiling(n/2)
    print(paste(c("Iteration ", val,
        ", number of possible answers reduced to ",
        n),collapse = ''))
    
}
```

---

## And the same code output


```
[1] "Iteration 1, # possible answers = 50"
[1] "Iteration 2, # possible answers = 25"
[1] "Iteration 3, # possible answers = 13"
[1] "Iteration 4, # possible answers = 7"
[1] "Iteration 5, # possible answers = 4"
[1] "Iteration 6, # possible answers = 2"
[1] "Iteration 7, # possible answers = 1"
```






