# CUNI-NATUR-Biostatistics L10 — AI disclosure for optional illustrations, 2026.
# Disclosure text -----
# Returns the visible AI disclosure only when the planned illustration
#   exists, so an empty slot carries no stray caption.
ai_disclosure <- function(data_source) {
  if (
    file.exists(here::here(path_materials, data_source))) {
    return("Ilustrace vytvořená pomocí AI.")
  }

  return("")
}
