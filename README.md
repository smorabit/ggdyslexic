# ggdyslexic 

`ggdyslexic` is a tiny R package to make `ggplot2` more visually accessible via the [**OpenDyslexic**](https://opendyslexic.org/) font.

## Installation

```r
# install.packages("devtools")
devtools::install_github("smorabit/ggdyslexic")
```

## Quick start

First, initialize the OpenDyslexic font (once per session) using `use_dyslexic()`, and then simply add `theme_dyslexic()` to any ggplot.

```r 

library(ggplot2)
library(ggdyslexic)

# enable the OpenDyslexic font (only need to run once per session)
use_dyslexic()

# apply the theme
ggplot(mtcars, aes(mpg, wt, color = as.factor(cyl))) +
    geom_point(size = 3) +
    labs(title = "Fuel Efficiency by Cylinder Count",
        subtitle = "with theme_dyslexic()") +
    theme_dyslexic() 


```

![mtcars dyslexic example ggplot](mtcars_dyslexic.png)
