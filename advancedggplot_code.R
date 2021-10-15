# Digi Data Visualization Series: Advanced ggplot2
# Keiko Bridwell
# 10/13/2021

##### Preparing R #####

#First, install either ggplot2 or tidyverse using the commands below, as well as the datasets package we will be using today.

# install.packages("ggplot2")
library(ggplot2)
# install.packages("tidyverse")
library(tidyverse)
# install.packages("datasets")
library(datasets)

summary(ChickWeight)

# relabel the Diet variable to make graphs more intuitive at later steps
ChickWeight$Diet <- factor(ChickWeight$Diet, labels = c("Diet 1", "Diet 2", "Diet 3", "Diet 4"))
summary(ChickWeight)


##### Color coding in bar graphs ####

ggplot(ChickWeight, aes(x=Time, y=weight)) +
  geom_bar(stat="summary", fun="mean")

# The stat="summary" section tells R to use the mean of all the values for each timestamp.
# When you use stat="summary", you should also include fun="mean".

# Now use fill=Diet to color code the bars based on the chicks' diet. What happens?
ggplot(ChickWeight, aes(x=Time, y=weight, fill=Diet)) +
  geom_bar(stat="summary", fun="mean")

# to display the different-colored bars beside each other instead of stacked, use position="dodge"
ggplot(ChickWeight, aes(y=weight, x=Time, fill=Diet)) +
  geom_bar(stat="summary", fun="mean", position="dodge")


##### Faceting plots #####

# facet the barplot into panels
ggplot(ChickWeight, aes(y=weight, x=Time, fill=Diet)) +
  geom_bar(stat="summary", fun="mean") +
  facet_wrap(vars(Diet))

# remove the legend
ggplot(ChickWeight, aes(y=weight, x=Time, fill=Diet)) +
  geom_bar(stat="summary", fun="mean") +
  facet_wrap(vars(Diet)) +
  theme(legend.position = "none")


##### Customizing scatterplots #####

# graph the data as a scatterplot
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_point() +
  facet_wrap(vars(Diet)) +
  theme(legend.position = "none")

# add a custom range for the y-axis
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_point() +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  theme(legend.position = "none")

# jitter and shrink the points; set the height to 0 so it will only jitter left-to-right
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  theme(legend.position = "none")


##### Regression lines #####

# overlay the plot with a smoothed line...what happens?
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0) +
  geom_smooth() +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  theme(legend.position = "none")

# overlay a straight regression line (with no confidence interval) on the scatterplot
# make the points more transparent
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  theme(legend.position = "none")


##### Modifying the theme #####

# add axis labels and title
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme(legend.position = "none")


# Play around with the theme. 
# Some of the preset options are theme_bw, theme_classic, theme_minimal, theme_light, theme_dark...pick a favorite. 
# Make sure to add your theme BEFORE the theme() where you've removed the legend, or it will erase all the theme edits you make.


# add a preset theme
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none")


# enlarge font size on axis ticks
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12))


# enlarge font size on axis labels, title, and the panel headers (where it says "Diet #")
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12),
        axis.title = element_text(size=14),
        strip.text = element_text(size=12),
        plot.title = element_text(size=16))


# add margins around labels and title, center title
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12),
        axis.title = element_text(size=14),
        strip.text = element_text(size=12),
        plot.title = element_text(size=16, hjust=0.5, margin = margin(b=10)),
        axis.title.x = element_text(margin = margin(t=10)), 
        axis.title.y = element_text(margin = margin(r=10)))


##### Color ####

# The color scheme in the above graph is ggplot2's default color setting, which is designed to be evenly spaced around the color wheel. However, if you don't like this color scheme, or it isn't working well for a particular plot, you can set your own color schemes, either manually or by using a preset palette.

# To set a color scheme manually, use scale_color_manual and list the colors that you want to appear. R recognizes the names of many colors and uses them as shortcuts for specific RGB/hexadecimal values, and you can search for a specific color using this manual (http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf).


# set colors manually
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  scale_color_manual(values = c("blue", "red", "orange", "green")) +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12),
        axis.title = element_text(size=14),
        strip.text = element_text(size=12),
        plot.title = element_text(size=16, hjust=0.5, margin = margin(b=10)),
        axis.title.x = element_text(margin = margin(t=10)), 
        axis.title.y = element_text(margin = margin(r=10)))


# Preset R color palettes:

# RColorBrewer (comes pre-installed): see palettes at http://applied-r.com/rcolorbrewer-palettes/
# viridis package: https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
# scico package
library(scico)
scico_palette_show()
# wesanderson package (designed to look like Wes Anderson movies: https://github.com/karthik/wesanderson

#To use one of these palettes for your graph, use scale_color_brewer.


# choose a color palette
ggplot(ChickWeight, aes(y=weight, x=Time, color=Diet)) +
  geom_jitter(size=0.9, width=.3, height=0, alpha=0.4) +
  geom_smooth(method="lm", se=FALSE) +
  facet_wrap(vars(Diet)) +
  scale_y_continuous(limits = c(0,400)) +
  scale_color_brewer(type = "qual", palette = "Dark2") +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12),
        axis.title = element_text(size=14),
        strip.text = element_text(size=12),
        plot.title = element_text(size=16, hjust=0.5, margin = margin(b=10)),
        axis.title.x = element_text(margin = margin(t=10)), 
        axis.title.y = element_text(margin = margin(r=10)))


##### Text labels ####

# look at just the Diet 2 chickens
ggplot(subset(ChickWeight, Diet == "Diet 2"), aes(y=weight, x=factor(Time))) +
  geom_jitter(size=1.5, width=.3, height=0) +
  scale_y_continuous(limits = c(0,400)) +
  scale_colour_brewer(type = "qual", palette = "Dark2") +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12), 
        axis.title = element_text(size=14), 
        strip.text = element_text(size=12),
        plot.title = element_text(size=16, hjust=0.5, margin = margin(b=10)),
        axis.title.x = element_text(margin = margin(t=10)), 
        axis.title.y = element_text(margin = margin(r=10)))


# label each chicken with its ID
# for a box around the text, use geom_label
ggplot(subset(ChickWeight, Diet == "Diet 2"), aes(y=weight, x=factor(Time))) +
  geom_text(aes(label=Chick), position = position_jitter(height=0)) +
  scale_y_continuous(limits = c(0,400)) +
  scale_colour_brewer(type = "qual", palette = "Dark2") +
  xlab("Age (days)") + ylab("Weight (g)") + ggtitle("Chick Weight Gain by Diet") +
  theme_bw() +
  theme(legend.position = "none",
        axis.text = element_text(size=12), 
        axis.title = element_text(size=14), 
        strip.text = element_text(size=12),
        plot.title = element_text(size=16, hjust=0.5, margin = margin(b=10)),
        axis.title.x = element_text(margin = margin(t=10)), 
        axis.title.y = element_text(margin = margin(r=10)))
