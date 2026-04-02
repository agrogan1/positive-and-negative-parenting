presentation_date <- as.Date("2026-4-7")

today <- Sys.Date()

ifelse(presentation_date > today,
       format(presentation_date, "%A, %B %d, %Y"),
       format(today, "%A, %B %d, %Y") )

ifelse(as.Date("2026-4-7") > Sys.Date(),
       "Tuesday, April 07, 2026",
       format(Sys.Date(), "%A, %B %d, %Y") )
