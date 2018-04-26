# First Markdown Document
Anya Steinhart  
January 23, 2018  



## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

## Including Plots

You can also embed plots, for example:

![](firsthtml_files/figure-html/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

## More Latex tricks

##Summation

$$\sum_{i=1}^S{n_i}=N$$

### Sentence texts

$$p(\mbox{Occurrence of species X})=0.67$$

### Escaping the backslash

$$\backslash a \le b \backslash$$

Rendering code of \LaTeX


```r
library(ggplot2)
waterTemp <- runif(50)
planktonAbun <- runif(50)
qplot(x=waterTemp, y=planktonAbun)
```

![](firsthtml_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

```r
# print(waterTemp)
# head(waterTemp)
```

Now we can add text here, say, anything we want, etc. because we no longer in R but in the world of `markdown`

![](firsthtml_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
