##### gapminder
library(dslabs)
library(tidyverse)
data(gapminder)



# Overview data
head(gapminder,10)
names(gapminder)

# Compare 
gapminder %>% 
  filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>%
  select(country,infant_mortality)

# Find the relationship of Fertility and life expectancy
ds_theme_set()
filter(gapminder,year %in% c(1962,2012)) %>%
  ggplot(aes(fertility,life_expectancy, color = continent)) +
  geom_point() + 
  facet_grid(continent~year) # Comparing plot

# Facet by year
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
gapminder %>%
  filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_wrap(~year) # 

# Add text labels to a plot
countries <- c("South Korea","Germany")
label <- data.frame(country = countries, x = c(1975,1965), y = c(60,72))

gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year,life_expectancy,col = country)) +
  geom_line() +
  geom_text(data = label, aes(x, y, label = country), size = 5) + # map text to plot
  theme(legend.position = "none") 


