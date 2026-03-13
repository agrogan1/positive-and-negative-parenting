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


reffects$explainbeta <- -0.014 + reffects$u10

explainnegative <- subset(reffects, subset = explainbeta < 0)

explainpositive <- subset(reffects, subset = explainbeta >= 0)

ggplot() +
  geom_segment(data = explainnegative,
               aes(x = 0,
                   xend = 1,
                   y = 0,
                   yend = (-0.014 + u10) * 1,
                   color = u10)) +
  geom_segment(data = explainpositive,
               aes(x = 0,
                   xend = 1,
                   y = 0,
                   yend = (-0.014 + u10) * 1),
               color = "grey") +
  # scale_color_viridis_d(option = "turbo") +
  scale_color_gradient(low = "chartreuse4",
                       high = "chartreuse") +
  labs(title = "A 'Slope Only' Spaghetti Plot",
       subtitle = "All Significant Associations of Verbal Reasoning \nWith Aggression Are Negative",
       x = "verbal reasoning",
       y = "aggression",
       caption = "every line is a country \ngrey lines are not statistically significant") +
  theme_minimal() +
  theme(legend.position = "none",
        aspect.ratio = 1)

ggsave("explain-spaghetti-plot.png",
       height = 5)

