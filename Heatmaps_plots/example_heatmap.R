# suppose you have a dataset of texts, split by word, with ids for words, sentences, line, page, position in line, where values are aggregated by item (what i was plotting here is the "perspective count").

library(readr)
mini_dataset <- read_csv("mini_dataset.csv")

# you can create a heatmap as follows (One text at the time, here Text 1)

mini_dataset %>%
  filter(Text== 1) %>%
  ggplot() +
  geom_tile(aes(x=Position, 
                y=Line_on_page,
                fill = Persp_count)) +
  scale_fill_viridis_c(limits=c(1, 5), option="inferno") +
  geom_text(aes(x=Position, 
                y=Line_on_page,
                label=word, colour = as.factor(Persp_count)),
            size = 4, check_overlap = T, family = "sans") +
  scale_color_manual(values = cols, guide = F) +  
  # scale_color_brewer(palette = "Greys", guide = F) +
  # scale_color_viridis_c(direction = -1, guide = F) +
  scale_y_reverse() +
  facet_grid(Page ~ Modified) +  
  theme(    
    # strip.text = element_text(size=7, face="bold.italic"),   
    axis.title.x = element_blank(), axis.title.y = element_blank())

