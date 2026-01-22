#' Register and enable OpenDyslexic for ggplot2
#'
#' This function locates the OpenDyslexic font files shipped with the package,
#' registers them with the system, and enables showtext rendering.
#'
#' @export
#' @examples
#' \dontrun{
#' library(ggplot2)
#' use_dyslexic()
#' ggplot(mtcars, aes(hp, mpg)) + geom_point() + theme_dyslexia()
#' }
use_dyslexic <- function() {
  font_path <- system.file("fonts", "OpenDyslexic-Regular.ttf", package = "ggdyslexia")
  
  if (font_path == "") {
    stop("Font file not found in the package. Try reinstalling 'ggdyslexia'.")
  }
  
  # register the font
  sysfonts::font_add("OpenDyslexic", regular = font_path)
  
  # start showtext
  showtext::showtext_auto()
}