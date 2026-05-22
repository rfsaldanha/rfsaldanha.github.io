library(tidyverse)
library(gganimate)

res <- cranlogs::cran_downloads(packages = "brclimr", from = "2023-03-07", to = "last-day") |>
  mutate(ccum = cumsum(count))



ggplot(data = res, aes(x = date, y = ccum)) +
  geom_line(color = "red", lwd = 1.5, alpha = .7) +
  geom_point(color = "red", size = 3) +
  theme_bw() +
  labs(title = "brclimr package downloads", x = "Date", y = "Downloads") +
  transition_reveal(date)



p <- ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point()

plot(p)

anim <- p +
  transition_states(Species,
                    transition_length = 2,
                    state_length = 1)

anim
