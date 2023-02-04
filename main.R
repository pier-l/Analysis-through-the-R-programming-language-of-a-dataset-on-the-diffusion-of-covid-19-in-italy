#Loading and filtering the dataset

library("readxl")
library("tidyverse")
cov_raw_1 <- read_xlsx(file.choose())
attach(cov_raw_1)
cov_raw_2 <- filter(cov_raw_1, country == "Italy")
attach(cov_raw_2)
cov_it <- select(cov_raw_2, country, year_week, age_group, new_cases)
cov_it <- as.data.frame(cov_it)
head(cov_it)
attach(cov_it)

#Searching for missing values (NA)

length(which(is.na(cov_it))) #Non sono presenti dati mancanti

##Exploratory analysis

coord_x <- year_week[age_group == "<15yr"]
y1 <- new_cases[age_group == "<15yr"]
y2 <- new_cases[age_group == "15-24yr"]
y3 <- new_cases[age_group == "25-49yr"]
y4 <- new_cases[age_group == "50-64yr"]
y5 <- new_cases[age_group == "65-79yr"]
y6 <- new_cases[age_group == "80+yr"]
colours = c("red", "darkgreen", "darkmagenta", "darkorange2", "deeppink", "blue2")
cols1 <- c("<15yr" = "red", "15-24yr" = "darkgreen", "80+yr" = "blue2")
cols2 <- c("25-49yr" = "darkmagenta", "50-64yr" = "darkorange2", "65-79yr" = "deeppink")
cols3 <- c("<15yr" = "red", "15-24yr" = "darkgreen","25-49yr" = "darkmagenta", 
           "50-64yr" = "darkorange2", "65-79yr" = "deeppink", "80+yr" = "blue2") 

#Infection trends for 3 age groups
ggplot() +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y1, group = 1, colour = "<15yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y2, group = 1, colour ="15-24yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y6, group = 1, colour ="80+yr"), linetype = "solid", size = 1) +
  scale_colour_manual(name = "Age Group", values = cols1) +
  theme(
    legend.title = element_text(face = "bold", size = 16),
    legend.text = element_text(color = "black", size = 14),
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  ) +
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid')) +
  ylim(0, 87900) +
  labs(title = "The spread of COVID-19 in Italy", x = "Year-Week", y = "New cases") +
  theme(plot.title = element_text(size = 16 , hjust = 0.5, face = "bold", colour = "black", )) +
  theme(axis.title = element_text(size = 14, face ="bold", colour = "black")) +
  theme(axis.text.x = element_text(size = 8, face = "bold", colour = "black", angle = 90)) +
  theme(axis.text.y = element_text(size = 8, face = "bold", colour = "black")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", size = 1.2, linetype = "solid"),
    panel.grid = element_line(colour = "grey"), 
  )

#Infection trends for the other 3 age groups
ggplot() +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y3, group = 1, colour ="25-49yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y4, group = 1, colour ="50-64yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y5, group = 1, colour ="65-79yr"), linetype = "solid", size = 1) +
  scale_colour_manual(name = "Age Group", values = cols2) +
  theme(
    legend.title = element_text(face = "bold", size = 16),
    legend.text = element_text(color = "black", size = 14),
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  ) +
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid')) +
  ylim(0, 87900) +
  labs(title = "The spread of COVID-19 in Italy", x = "Year-Week", y = "New cases") +
  theme(plot.title = element_text(size = 16 , hjust = 0.5, face = "bold", colour = "black", )) +
  theme(axis.title = element_text(size = 14, face ="bold", colour = "black")) +
  theme(axis.text.x = element_text(size = 8, face = "bold", colour = "black", angle = 90)) +
  theme(axis.text.y = element_text(size = 8, face = "bold", colour = "black")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", size = 1.2, linetype = "solid"),
    panel.grid = element_line(colour = "grey"), 
  )

#Infection trends for all age groups
ggplot() +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y1, group = 1, colour ="<15yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y2, group = 1, colour ="15-24yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y3, group = 1, colour ="25-49yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y4, group = 1, colour ="50-64yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y5, group = 1, colour ="65-79yr"), linetype = "solid", size = 1) +
  geom_line(data = cov_it[1:65,], aes(x = coord_x, y = y6, group = 1, colour ="80+yr"), linetype = "solid", size = 1) +
  scale_colour_manual(name = "Age Group", values = cols3) +
  theme(
    legend.title = element_text(face = "bold", size = 16),
    legend.text = element_text(color = "black", size = 14),
    legend.position = c(.18, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  ) +
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid')) +
  ylim(0, 87900) +
  labs(title = "The spread of COVID-19 in Italy", x = "Year-Week", y = "New cases") +
  theme(plot.title = element_text(size = 16 , hjust = 0.5, face = "bold", colour = "black", )) +
  theme(axis.title = element_text(size = 14, face ="bold", colour = "black")) +
  theme(axis.text.x = element_text(size = 8, face = "bold", colour = "black", angle = 90)) +
  theme(axis.text.y = element_text(size = 8, face = "bold", colour = "black")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", size = 1.2, linetype = "solid"),
    panel.grid = element_line(colour = "grey"), 
  )

#Boxplot
ggplot(cov_it, aes(x = age_group, y = new_cases, fill = age_group)) +
  geom_boxplot(fatten = 2.5) +
  scale_fill_manual(values = colours) +
  labs(title = "Boxplot", x = "Age group", y = "New cases") + 
  theme(plot.title = element_text(size = 19 , hjust = 0.5, face ="bold", colour = "black")) +
  theme(axis.text = element_text(size = 14, colour = "black")) +  
  theme(axis.title = element_text(size = 17, face ="bold", colour = "black")) +
  theme(legend.position = "none") +
  stat_boxplot(geom = "errorbar") +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", size = 1.2, linetype = "solid"),
  )

#Summary for each age group
summary(cov_it[age_group=="<15yr",4])
summary(cov_it[age_group=="15-24yr",4])
summary(cov_it[age_group=="25-49yr",4])
summary(cov_it[age_group=="50-64yr",4])
summary(cov_it[age_group=="65-79yr",4])
summary(cov_it[age_group=="80+yr",4])

#Verification of the number of observations in each group
n_osservazioni_under_15 <- length(new_cases[age_group == "<15yr"])
n_osservazioni_15_24 <- length(new_cases[age_group == "15-24yr"])
n_osservazioni_25_49 <- length(new_cases[age_group == "25-49yr"])
n_osservazioni_50_64 <- length(new_cases[age_group == "50-64yr"])
n_osservazioni_65_79 <- length(new_cases[age_group == "65-79yr"])
n_osservazioni_over_80 <- length(new_cases[age_group == "80+yr"])

#Normal Q-Q plot for each age group
qqnorm(new_cases[age_group == "<15yr"],main = "Under-15 yr")
qqline(new_cases[age_group == "<15yr"], col = "red")
qqnorm(new_cases[age_group == "15-24yr"],main = "15-24 yr")
qqline(new_cases[age_group == "15-24yr"], col = "darkgreen")
qqnorm(new_cases[age_group == "25-49yr"],main = "25-49 yr")
qqline(new_cases[age_group == "25-49yr"], col = "darkmagenta")
qqnorm(new_cases[age_group == "50-64yr"],main = "50-64 yr")
qqline(new_cases[age_group == "50-64yr"], col = "darkorange2")
qqnorm(new_cases[age_group == "65-79yr"],main = "65-79 yr")
qqline(new_cases[age_group == "65-79yr"], col = "deeppink")
qqnorm(new_cases[age_group == "80+yr"],main = "Over-80 yr")
qqline(new_cases[age_group == "80+yr"], col = "blue2")

##Verification of requirements for ANOVA

#Normality test

#Lilliefors test
library(nortest)
lillie.test(cov_it[age_group == "<15yr", 4])
lillie.test(cov_it[age_group == "15-24yr", 4])
lillie.test(cov_it[age_group == "25-49yr", 4])
lillie.test(cov_it[age_group == "50-64yr", 4])
lillie.test(cov_it[age_group == "65-79yr", 4])
lillie.test(cov_it[age_group == "80+yr", 4])

#Shapiro-Wilk test
shapiro.test(cov_it[age_group == "<15yr", 4])
shapiro.test(cov_it[age_group == "15-24yr", 4])
shapiro.test(cov_it[age_group == "25-49yr", 4])
shapiro.test(cov_it[age_group == "50-64yr", 4])
shapiro.test(cov_it[age_group == "65-79yr", 4])
shapiro.test(cov_it[age_group == "80+yr", 4])

#Bartlett test
bartlett.test(new_cases, age_group)

#Kruskal-Wallis test
kruskal.test(new_cases, age_group)

##Post-hoc Analysis 

#Bonferroni correction
pairwise.wilcox.test(new_cases, age_group, p.adj="bonferroni")

#Benjamini-Hochberg Procedure
pairwise.wilcox.test(new_cases, age_group, p.adj="BH")