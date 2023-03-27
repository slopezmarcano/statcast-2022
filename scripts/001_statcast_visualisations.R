#SLM
#Created:20032023


#--DESCRIPTION--#
# a few visualisations and analysis of MLB statcast data

#--LIBRARIES--#
suppressPackageStartupMessages(library(tidyverse)) #data wrangling and management
suppressPackageStartupMessages(library(treemap))
suppressPackageStartupMessages(library(ggthemes)) #ggplot themes
suppressPackageStartupMessages(library(ggiraph))
#suppressPackageStartupMessages(library(ggtext)) #add and modify text to ggpplot
#suppressPackageStartupMessages(library(showtext)) #fonts
#font_add_google("Lato") #theme font
#showtext_auto()
#suppressPackageStartupMessages(library(arrrow)) #if using big data

#--INSTALL LIBRARIES--#
#install.libraries(c("tidyverse", "ggthemes", "ggtext", "showtext", "arrow"))

#--DATASET--#
data <- read_csv('data/mlb_statcast_2022.csv')

#--DISRTIBUTION OF PLAYERS BY COUNTRY--#
#counts
counts <- data %>%
    group_by(country) %>%
    count()

#visualisation
treemap(counts,
        index = "country",
        vSize = "n",
        title = "Counts by Country",
        fontsize.title = 16,
        fontsize.labels = 14,
        palette = palettoni)

#--MAXIMUM HOME RUN DISTANCE BY COUNTRY--#
#get the player that hit the ball the furthest
max_row <- data[which.max(data$max_distance),] %>%
        mutate(link = "https://www.youtube.com/watch?v=kqklZHfQVjQ",
                link_name = "MLB video")
player_label <- paste(max_row$first_name, max_row$last_name)

p<-data %>%
  ggplot(aes(x=country, y=max_distance, fill=country)) +
    geom_boxplot() +
    scale_fill_manual(values=palettoni) +
    geom_jitter(color="#000000dd", size=0.4, alpha=0.9) +
    geom_text(data = subset(data, max_distance >480), aes(label=paste(last_name, first_name, attempts)), vjust =-1)+
    geom_text(data = subset(data, max_distance <390), aes(label=paste(last_name, first_name, attempts)), vjust =-1)+
    geom_point_interactive(max_row, aes(x=country, y=max_distance,
                tooltip=paste0("<a href='", link, "'>", link_name, "</a>\n", link, onclick=paste0('window.open("', link , '")'))))+
    labs(
        x= "",
        y = "Maximun Hit Distance (Yards)",
        title = "StatCast Maximum Distance by Country in 2022",
        subtitle = "",
        caption = "Visualization by S Lopez Marcano • ") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))




girafe(ggobj=p,
       height_svg = 5,
       width_svg = 5)
 
#--VISUALISATIONS--#
plot <- ggplot(data, aes(x = , y = )) +
    labs(
        x= "",
        y = "",
        title = "",
        subtitle = "",
        caption = "Visualization by S Lopez Marcano • .")



#--EXPORTING VISUALISATIONS--#
ggsave('outputs/insert_file_name_here.pdf', width=, height=)