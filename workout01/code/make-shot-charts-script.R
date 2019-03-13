################################
## title: make shot charts 
## description: 
## inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, 
##         klay-thompson.csv, stephen-curry.csv
## outputs: andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, 
##          kevin-durant-shot-chart.pdf,klay-thompson-shot-chart.pdf, 
##          stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png
################################

library(ggplot2)

ai <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
dg <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
kd <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
kt <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
sc <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)

# scatterplot
klay_scatterplot <- ggplot(data = kt) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

library(jpeg)
library(grid)

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart <- ggplot(data = kt) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

# 4.1) Shot charts of each player
# andre-iguodala-shot-chart.pdf
pdf(file = "images/andre-iguodala-shot-chart.pdf",width=6.5,height = 5)
ggplot(data = ai) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()

# draymond-green-shot-chart.pdf
pdf(file = "images/draymond-green-shot-chart.pdf",width=6.5,height = 5)
ggplot(data = dg) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()

# kevin-durant-shot-chart.pdf
pdf(file = "images/kevin-durant-shot-chart.pdf",width=6.5,height = 5)
ggplot(data = kd) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

# klay-thompson-shot-chart.pdf
pdf(file = "images/klay-thompson-shot-chart.pdf",width=6.5,height = 5)
ggplot(data = kt) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
dev.off()

# stephen-curry-shot-chart.pdf
pdf(file = "images/stephen-curry-shot-chart.pdf",width=6.5,height = 5)
ggplot(data = sc) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
dev.off()

# 4.2) Facetted Shot Chart
pdf(file = "images/gsw-shot-charts.pdf",width = 8,height = 7)
ggplot(data = shots_data) +
  facet_wrap(~ name) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Shots Data (2016 season)') +
  theme_minimal()
dev.off()

png(filename = "images/gsw-shot-charts.png",width = 8,height = 7,units = "in",res = 200)
ggplot(data = shots_data) +
  facet_wrap(~ name) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Shots Data (2016 season)') +
  theme_minimal()
dev.off()