# plotting overlap

# make data

x <- seq(-4, 4, .1)

y1 <- dnorm(x)

y2 <- dnorm(x-1)

mydata <- data.frame(x, y1, y2)

# plotting

library(ggplot2)

library(latex2exp)

ggplot(data=NULL,
       aes(x = x)) +
  geom_line(aes(y = y1), 
            color = "red",
            linewidth = 3) +
  geom_line(aes(y = y2), 
            color = "blue",
            linewidth = 3) +
  geom_ribbon(aes(ymin = 0, 
                  ymax = pmin(y1,y2)), 
              fill = "purple", 
              alpha = 0.5) +
  labs(title = "Overlap of Two Distributions",
       subtitle = TeX(r'($\eta = \int min[f(x), g(x)] dx$)'),
       x = "x",
       y = "y") +
  theme_minimal() +
  theme(title = element_text(size = rel(2)))

ggsave("overlap-heuristic.png")

