#SLM
#Created:


#--DESCRIPTION--#

#--LIBRARIES--#
suppressPackageStartupMessages(library(tidyverse)) #data wrangling and management
#suppressPackageStartupMessages(library(ggthemes)) #ggplot themes
#suppressPackageStartupMessages(library(ggtext)) #add and modify text to ggpplot
#suppressPackageStartupMessages(library(showtext)) #fonts
#font_add_google("Lato") #theme font
#showtext_auto()
#suppressPackageStartupMessages(library(arrrow)) #if using big data

#--INSTALL LIBRARIES--#
#install.libraries(c("tidyverse", "ggthemes", "ggtext", "showtext", "arrow"))

#--DATASET--#
data <- read_csv('data/mlb_statcast_2022.csv')
#data <- read_parquet('data/.parquet')

counts <- data %>%
    group_by(country) %>%
    count()
# Package
library(treemap)

treemap(counts,
        index = "country",
        vSize = "n",
        title = "Counts by Country",
        fontsize.title = 16,
        fontsize.labels = 14,
        palette = palettoni)

#--DATA WRANGLING--#



 
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