# CUNI-NATUR-Biostatistics L10 — optional generated illustrations, 2026.
# Include an optional figure -----
# Shows a planned illustration from Presentation/Materials when its file
#   exists. Until it is generated, shows the fallback figure (if given) or
#   leaves the reserved slot empty. Planned files are listed in
#   Presentation/Materials/GENERATED_IMAGES.md.
include_optional_figure <- function(data_source, fallback = NULL) {
  path_figure <- here::here(path_materials, data_source)

  if (
    file.exists(path_figure)) {
    return(include_local_figure(data_source))
  }

  if (!is.null(fallback)) {
    return(include_local_figure(fallback))
  }

  return(invisible(NULL))
}
