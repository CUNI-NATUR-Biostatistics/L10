#----------------------------------------------------------#
#
#
#                         L10
#
#           Prepare Galapagos species-area data
#
#               Claude (Anthropic) and Ondřej Mottl
#                         2026
#
#----------------------------------------------------------#

# The source table is read from the pinned CRAN source package of {faraway}
#    without installing it, so the lesson environment does not need
#    {faraway} and its modelling dependencies.


#----------------------------------------------------------#
# Download the pinned source package -----
#----------------------------------------------------------#

source_version <- "1.0.9"
source_sha256 <-
  paste0(
    "1074ed85a0cf018fc2fd3e2a48bed666",
    "b2fa06b8461b7a3820aeb67b34a52d5d"
  )

vec_source_urls <-
  c(
    paste0(
      "https://cran.r-project.org/src/contrib/faraway_",
      source_version,
      ".tar.gz"
    ),
    paste0(
      "https://cran.r-project.org/src/contrib/Archive/faraway/faraway_",
      source_version,
      ".tar.gz"
    )
  )

path_tarball <-
  tempfile(fileext = ".tar.gz")

# The current-release URL stops working once a newer version is published.
is_downloaded <- FALSE

for (
  source_url in vec_source_urls
  ) {
  download_status <-
    try(
      expr = utils::download.file(
        url = source_url,
        destfile = path_tarball,
        mode = "wb",
        quiet = TRUE
      ),
      silent = TRUE
    )

  if (
    identical(download_status, 0L)
  ) {
    is_downloaded <- TRUE
    break
  }
}

if (
  !is_downloaded
) {
  cli::cli_abort(
    "Could not download {.pkg faraway} {source_version} from CRAN."
  )
}

if (
  digest::digest(
    object = path_tarball,
    algo = "sha256",
    file = TRUE
  ) != source_sha256
) {
  cli::cli_abort(
    "The downloaded {.pkg faraway} source package has an unexpected SHA-256."
  )
}


#----------------------------------------------------------#
# Extract the source table -----
#----------------------------------------------------------#

path_extract <-
  tempfile()

utils::untar(
  tarfile = path_tarball,
  files = "faraway/data/galamiss.rda",
  exdir = path_extract
)

env_source <-
  new.env()

load(
  file = file.path(
    path_extract,
    "faraway",
    "data",
    "galamiss.rda"
  ),
  envir = env_source
)

# `galamiss` keeps the original missing elevations; `gala` fills them in.
data_galapagos_source <-
  get(
    x = "galamiss",
    envir = env_source
  )


#----------------------------------------------------------#
# Prepare the teaching table -----
#----------------------------------------------------------#

# Island names are stored only as row names, without spaces.
vec_island_names <-
  rownames(data_galapagos_source) |>
  stringr::str_replace_all(
    pattern = "\\.",
    replacement = " "
  ) |>
  stringr::str_replace_all(
    pattern = "([a-z])([A-Z0-9])",
    replacement = "\\1 \\2"
  )

data_galapagos_teaching <-
  data_galapagos_source |>
  tibble::as_tibble() |>
  dplyr::transmute(
    ostrov = vec_island_names,
    pocet_druhu = as.integer(.data$Species),
    pocet_endemitu = as.integer(.data$Endemics),
    plocha_km2 = .data$Area,
    nejvyssi_bod_m = .data$Elevation,
    vzdalenost_nejblizsi_km = .data$Nearest,
    vzdalenost_santa_cruz_km = .data$Scruz,
    plocha_sousedniho_km2 = .data$Adjacent
  )

if (
  nrow(data_galapagos_teaching) != 30L ||
    sum(is.na(data_galapagos_teaching)) != 6L ||
    anyNA(data_galapagos_teaching$pocet_druhu) ||
    anyDuplicated(data_galapagos_teaching$ostrov) > 0L
) {
  cli::cli_abort(
    "The prepared Galapagos table failed its row, name, or missing-value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_galapagos_teaching,
  file = here::here(
    "data",
    "druhy_galapagy.csv"
  ),
  na = ""
)
