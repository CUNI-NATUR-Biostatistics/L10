#----------------------------------------------------------#
#
#
#                         L10
#
#      Render PollsLive evidence assets (retrieves L09)
#
#
#----------------------------------------------------------#

# The three evidence images reproduce familiar L09 displays from the approved
# L09 teaching data (conifer allometry, lgrdata::allometry, CC0). L10 keeps an
# unchanged copy in data/allometrie_stromu.csv. The copy is verified by a
# line-ending-independent SHA-256 so that the check behaves the same on Windows
# and Linux checkouts.

here::i_am("R/render_pollslive_assets.R")

source_path <-
  here::here("data", "allometrie_stromu.csv")

output_dir <-
  here::here("pollslive", "assets")

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

#----------------------------------------------------------#
# 1. Verify the source -----
#----------------------------------------------------------#

# Same content as L09 data/allometrie_stromu.csv at L09 revision
# 1723cb5fffa5c7ace7b5dbba8f89852a1b1a4078
expected_source_hash <-
  "454dde41426a44d5f206564c0d732f772ded8a1d4ff82816fcd3a4eaae7a9338"

text_source <-
  paste(
    readLines(source_path, warn = FALSE, encoding = "UTF-8"),
    collapse = "\n"
  )

hash_source <-
  digest::digest(text_source, algo = "sha256", serialize = FALSE)

if (!identical(hash_source, expected_source_hash)) {
  stop(
    "data/allometrie_stromu.csv does not match the pinned L09 source ",
    "(normalised SHA-256 ", hash_source, ")."
  )
}

#----------------------------------------------------------#
# 2. Rebuild the three L09 candidate models -----
#----------------------------------------------------------#

data_stromy <-
  utils::read.csv(source_path)

data_stromy$druh_stromu <-
  factor(x = data_stromy$druh_stromu)

vec_nazvy_modelu <-
  c(
    "Společná přímka",
    "Posun mezi druhy",
    "Různé sklony"
  )

list_kandidati <-
  list(
    stats::lm(
      formula = vyska_stromu_m ~ prumer_kmene_cm,
      data = data_stromy
    ),
    stats::lm(
      formula = vyska_stromu_m ~ prumer_kmene_cm + druh_stromu,
      data = data_stromy
    ),
    stats::lm(
      formula = vyska_stromu_m ~ prumer_kmene_cm * druh_stromu,
      data = data_stromy
    )
  )

data_metriky <-
  data.frame(
    model = factor(vec_nazvy_modelu, levels = vec_nazvy_modelu),
    k = vapply(list_kandidati, function(x) length(stats::coef(x)), integer(1)),
    r2 = vapply(list_kandidati, function(x) summary(x)$r.squared, numeric(1)),
    r2_adj = vapply(list_kandidati, function(x) summary(x)$adj.r.squared, numeric(1)),
    aic = vapply(list_kandidati, stats::AIC, numeric(1))
  )

data_metriky$delta_aic <-
  data_metriky$aic - min(data_metriky$aic)

stopifnot(
  nrow(data_stromy) == 63,
  identical(data_metriky$k, c(2L, 4L, 6L)),
  which.max(data_metriky$r2) == 3,
  which.max(data_metriky$r2_adj) == 2,
  which.min(data_metriky$aic) == 2
)

#----------------------------------------------------------#
# 3. Shared styling -----
#----------------------------------------------------------#

cols <-
  c(
    parchment = "#F4F1EC",
    indigo = "#5D2890",
    graphite = "#2E2E2E",
    grey = "#8A8A8A",
    orange = "#F3A712"
  )

theme_quiz <-
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = cols[["parchment"]],
      colour = NA
    ),
    panel.grid.minor = ggplot2::element_blank(),
    plot.title = ggplot2::element_text(
      colour = cols[["indigo"]],
      face = "bold",
      size = 26
    ),
    plot.subtitle = ggplot2::element_text(colour = cols[["graphite"]]),
    text = ggplot2::element_text(colour = cols[["graphite"]])
  )

theme_table <-
  theme_quiz +
  ggplot2::theme(
    axis.text = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank()
  )

save_quiz_plot <- function(plot, filename) {
  ggplot2::ggsave(
    filename = here::here(output_dir, filename),
    plot = plot,
    width = 10,
    height = 5.625,
    dpi = 160,
    bg = cols[["parchment"]]
  )
}

format_cz <- function(x, digits) {
  formatC(x = x, format = "f", digits = digits, decimal.mark = ",")
}

# Draw a small metric table: one row per candidate, one column per metric
plot_metric_table <- function(data_cells, vec_headers, vec_x, title, subtitle) {

  ggplot2::ggplot() +
    ggplot2::annotate(
      geom = "text",
      x = c(0.02, vec_x),
      y = 4.1,
      label = c("Model", vec_headers),
      hjust = c(0, rep(1, length(vec_headers))),
      size = 7,
      colour = cols[["grey"]]
    ) +
    ggplot2::annotate(
      geom = "text",
      x = 0.02,
      y = 3:1,
      label = vec_nazvy_modelu,
      hjust = 0,
      size = 9,
      colour = cols[["graphite"]],
      fontface = "bold"
    ) +
    ggplot2::geom_text(
      data = data_cells,
      mapping = ggplot2::aes(
        x = vec_x[sloupec],
        y = 4 - radek,
        label = hodnota
      ),
      hjust = 1,
      size = 9,
      colour = cols[["indigo"]]
    ) +
    ggplot2::scale_x_continuous(limits = c(-0.02, 1.02)) +
    ggplot2::scale_y_continuous(limits = c(0.5, 4.5)) +
    ggplot2::labs(title = title, subtitle = subtitle) +
    theme_table
}

#----------------------------------------------------------#
# 4. Q1: k, R² and adjusted R² -----
#----------------------------------------------------------#

data_q1 <-
  data.frame(
    radek = rep(1:3, times = 3),
    sloupec = rep(1:3, each = 3),
    hodnota = c(
      as.character(data_metriky$k),
      format_cz(data_metriky$r2, 3),
      format_cz(data_metriky$r2_adj, 3)
    )
  )

graf_q1 <-
  plot_metric_table(
    data_cells = data_q1,
    vec_headers = c("k", "R²", "adjustované R²"),
    vec_x = c(0.5, 0.7, 0.97),
    title = "Tři kandidátní modely pro výšku stromů",
    subtitle = "odezva: vyska_stromu_m · stejných 63 stromů v každém modelu"
  )

save_quiz_plot(graf_q1, "l09-r2-adjustovane.png")

#----------------------------------------------------------#
# 5. Q2: AIC and ΔAIC -----
#----------------------------------------------------------#

data_q2 <-
  data.frame(
    radek = rep(1:3, times = 2),
    sloupec = rep(1:2, each = 3),
    hodnota = c(
      format_cz(data_metriky$aic, 2),
      format_cz(data_metriky$delta_aic, 2)
    )
  )

graf_q2 <-
  plot_metric_table(
    data_cells = data_q2,
    vec_headers = c("AIC", "ΔAIC"),
    vec_x = c(0.65, 0.97),
    title = "AIC tří kandidátních modelů",
    subtitle = "odezva: vyska_stromu_m · stejných 63 stromů v každém modelu"
  )

save_quiz_plot(graf_q2, "l09-delta-aic.png")

#----------------------------------------------------------#
# 6. Q3: residual arch of the shift model -----
#----------------------------------------------------------#

data_residua <-
  data.frame(
    odhad = stats::fitted(list_kandidati[[2]]),
    residuum = stats::residuals(list_kandidati[[2]])
  )

graf_q3 <-
  ggplot2::ggplot(
    data = data_residua,
    mapping = ggplot2::aes(x = odhad, y = residuum)
  ) +
  ggplot2::geom_hline(
    yintercept = 0,
    linetype = "dashed",
    colour = cols[["graphite"]]
  ) +
  ggplot2::geom_point(
    colour = cols[["grey"]],
    size = 2.8,
    alpha = 0.9
  ) +
  ggplot2::geom_smooth(
    method = "loess",
    formula = y ~ x,
    se = FALSE,
    colour = cols[["orange"]],
    linewidth = 1.6
  ) +
  ggplot2::labs(
    title = "Residua modelu Posun mezi druhy",
    subtitle = "vyska_stromu_m ~ prumer_kmene_cm + druh_stromu · oranžová křivka vyhlazuje průběh bodů",
    x = "Odhadnutá výška stromu (m)",
    y = "Residuum (m)"
  ) +
  theme_quiz +
  ggplot2::theme(plot.subtitle = ggplot2::element_text(size = 14))

save_quiz_plot(graf_q3, "l09-oblouk-residui.png")

message("Rendered three L10 PollsLive evidence assets (retrieving L09).")
