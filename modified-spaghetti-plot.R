library(haven)

reffects <- read_dta("reffects.dta")

library(ggplot2)

reffects$spankbeta <- .023 + reffects$u4

reffects$spankbetaPOSITIVE <- ifelse(reffects$spankbeta > 0, 
                                     reffects$spankbeta, 
                                     NA)

reffects$spankbetaNEGATIVE <- ifelse(reffects$spankbeta <= 0, 
                                     reffects$spankbeta, 
                                     NA)

  
ggplot(reffects,
       aes(color = country)) +
  geom_segment(aes(x = 0,
                   xend = 1,
                   y = 0,
                   yend = (.023 + u4) * 1,
                   color = u4 > 0)) +
  scale_color_manual(values = c("grey", 
                                "red", 
                                "grey")) +
  labs(title = "A 'Slope Only' Spaghetti Plot",
       subtitle = "Of The Associations of Spanking With Aggression",
       x = "spanking",
       y = "aggression",
       caption = "red values are statistically significant \ngrey values are not") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("modified-spaghetti-plot.png",
       height = 3)


