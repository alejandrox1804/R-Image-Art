library(imager)
library(tidyverse)
library(ggvoronoi)

img <- load.image('Wilhelm Sasnal Untitled (The Moon).jpg')
img_df <- as_tibble(as.data.frame(img)) %>%
    mutate(cc = case_when(cc == 1 ~ 'red',
                          cc == 2 ~ 'green',
                          cc == 3 ~ 'blue')) %>%
    spread(cc,value) %>%
    mutate(color = rgb(red,green,blue))

ggplot(img_df) +
    geom_point(aes(x = x, y = y, color = color)) +
    scale_color_identity() +
    scale_y_reverse() +
    theme_void()
