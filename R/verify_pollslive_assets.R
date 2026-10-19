#----------------------------------------------------------#
# Verify approved local evidence for the L10 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l09-aic.png" =
      "382eab2835c7954dbe6f6d09f55be922276cf51b32909ccc7d247567ea8d7d74",
    "l09-r2-adjustovane.png" =
      "31ca63018d19bbca00ed132f4ed142b1382b8edc0cd0fe7ac6190703312c16aa",
    "l09-oblouk-residui.png" =
      "4b7c8b29b1886b8f94879916e2090b16749d0b508a17391897cab64a5384ad20"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
