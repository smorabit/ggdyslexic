#' ggplot2 theme with OpenDyslexic font
#' 
#' @return A ggplot2 theme object.
#' @export
theme_dyslexic <- function() {
    ggplot2::theme(
        text = ggplot2::element_text(family = "OpenDyslexic")
    )
}