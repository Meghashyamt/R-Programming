library(tidyverse)
library(dplyr)
library(ggplot2)
pokemon <- read.csv("/home/shyam/Documents/pokemon.csv")

pokemon
pokemon <- pokemon %>%
mutate(height_diff = height_new - height)

pokemon %>%
  count(height_diff>0) %>%
  arrange(n)

#100% of Pokemon grew during evolution, since we can observe that there are 75 Pokemon included in the dataset, and all 75 of them have a positive height difference.

ggplot(data = pokemon, mapping = aes(x = height, y = height_diff, color = species)) + geom_point() + labs(title = "Change in height per evolution by species", x = "Pre-evolution Height", y = "Change in Height", color = "Species") + theme_minimal()

# Question 2

pokemon %>%
  filter(species == "Caterpie"|species == "Eevee"|species == "Pidgey") %>%
  ggplot(aes(x = species, fill = attack_weak)) + geom_bar(position = "dodge") + coord_flip() + labs(title = "Pre-evolution weaker attack of the Pokemon", subtitle = "by species", x = "Frequency", y = "Species", fill = "Attack weak") + theme_minimal()


# Question 3

pokemon %>%
  count(attack_strong_new) %>%
  mutate(prop = n/sum(n))

pokemon %>%
  count(attack_strong) %>%
  mutate(prop = n/sum(n))

rf <- pokemon %>%
  count(attack_strong_new, attack_strong)%>%
  mutate(attack_strong = ifelse(attack_strong_new == attack_strong, "Unchanged", "Changed"))%>%
  group_by(attack_strong_new)%>%
  mutate(relfreq = n/sum(n))

rf


# Question 4 

pokemon %>%
  ggplot(aes(fill = attack_strong_type, x = species)) + geom_bar(position = "dodge") + labs(title = "Pre-evolution strong attack type by Pokemon", x = "Species", y = "Frequency", fill = "Attack type strong") + theme_minimal()

# Question 5

ggplot(data = pokemon, mapping = aes(x = species, y = cp, fill = species)) + geom_boxplot() + labs(title = "Pre-evolution CP by species", x = "Species", y = "CP", fill = "species") + theme_minimal()

# Question 6

ggplot(data = pokemon, mapping = aes(x = species, y = cp, fill = species)) + geom_violin() + labs(title = "Pre-evolution CP by species", x = "Species", y = "CP", fill = "species") + theme_minimal()

# Question 7

ggplot(data = pokemon, mapping = aes(x = cp_new, y = height_new, size = weight_new, color = species)) + geom_point() + theme_minimal() + labs(title = "Characteristics of Evolved Pokemon by CP", x = "New CP", y = "New Height", size = "New Weight", color = "Species")

#Evolved Eevees tend to have the highest CP, while evolved Caterpies and Weedles tend to have the lowest CP, and Pidgey's have the largest spread of CPs. Evolved Pokemon with greater heights tend to have higher new CP, while there is very little correlation between New CP and New Weight.




