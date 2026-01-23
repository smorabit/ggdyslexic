#' Load and/or Activate OpenDyslexic for ggplot2
#'
#' @param active Logical. If TRUE (default), sets OpenDyslexic as the global 
#'   theme and geom default. Requires load_font to be TRUE or already loaded.
#' @param load_font Logical. If TRUE (default), registers the OpenDyslexic 
#'   font files with R's font library.
#'
#' @export
use_dyslexic <- function(active = TRUE, load_font=TRUE) {
  
  if (load_font) {
    font_path <- system.file("fonts", "OpenDyslexic-Regular.ttf", package = "ggdyslexic")
    
    if (font_path == "") {
      stop("Font file not found. Please reinstall 'ggdyslexic'.")
    }

    # Register font with sysfonts
    sysfonts::font_add("OpenDyslexic", regular = font_path)
    message("OpenDyslexic font loaded.")
  }
  
  if (isTRUE(active)) {
    # Start showtext
    showtext::showtext_auto(TRUE)
    
    # Update Geoms (the "ink" on the canvas)
    ggplot2::update_geom_defaults("text", list(family = "OpenDyslexic"))
    ggplot2::update_geom_defaults("label", list(family = "OpenDyslexic"))
    if (requireNamespace("ggrepel", quietly = TRUE)) {
      ggplot2::update_geom_defaults("text_repel", list(family = "OpenDyslexic"))
      ggplot2::update_geom_defaults("label_repel", list(family = "OpenDyslexic"))
    }
    
    # Update Theme Defaults (the "canvas" itself)
    # This makes every plot use OpenDyslexic by default
    ggplot2::theme_set(ggplot2::theme(
        text = ggplot2::element_text(family = "OpenDyslexic")
    ))
    
    message("Dyslexic mode active: Font and Theme defaults updated.")
    
  } else if (!(active) || (!"OpenDyslexic" %in% sysfonts::font_families())) {

    # Revert Geoms to "sans"
    ggplot2::update_geom_defaults("text", list(family = "sans"))
    ggplot2::update_geom_defaults("label", list(family = "sans"))
    if (requireNamespace("ggrepel", quietly = TRUE)) {
      ggplot2::update_geom_defaults("text_repel", list(family = "sans"))
    }

    ggplot2::theme_set(ggplot2::theme_gray())
    message("Dyslexic mode deactivated.")
  }
  
}
  
  # else {
    # Deactivate and revert
#     showtext::showtext_auto(FALSE)
    
#     # Revert Geoms to "sans"
#     ggplot2::update_geom_defaults("text", list(family = "sans"))
#     ggplot2::update_geom_defaults("label", list(family = "sans"))
#     if (requireNamespace("ggrepel", quietly = TRUE)) {
#       ggplot2::update_geom_defaults("text_repel", list(family = "sans"))
#     }
    
#     # Revert Theme to the standard Gray theme
#     ggplot2::theme_set(ggplot2::theme_gray())
    
#     message("Dyslexic mode deactivated: Reverted to default ggplot2 settings.")
#   }
}