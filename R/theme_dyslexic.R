#' Accessible ggplot2 theme with OpenDyslexic
#' 
#' @param base_size Numeric. Base font size.
#' @return A ggplot2 theme object.
#' @export
theme_dyslexic <- function(base_size = 14) {
    ggplot2::theme(text = ggplot2::element_text(family = "OpenDyslexic"))
}