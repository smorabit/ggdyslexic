# ggdyslexic 📖

`ggdyslexia` is a tiny R package to make `ggplot2` more accessible for people with dyslexia by integrating the **OpenDyslexic** font directly into your workflow.

## Installation

```r
# install.packages("devtools")
devtools::install_github("smorabit/ggdyslexic")
```

## Quick start

To use the font, you simply need to initialize it once per session using `use_dyslexic()`.

```r 

library(ggplot2)
library(ggdyslexic)

# load the font and enable showtext
use_dyslexic()

# apply the theme
ggplot(mtcars, aes(mpg, wt, color = as.factor(cyl))) +
    geom_point(size = 3) +
    labs(title = "Fuel Efficiency by Cylinder Count",
        subtitle = "with theme_dyslexic()") +
    theme_dyslexic() 


```

![mtcars dyslexic example ggplot](mtcars_dyslecix.png)
