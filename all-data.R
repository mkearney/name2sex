library(tidyverse)
ipums_data <- genderdata::ipums_usa %>%
  group_by(name) %>%
  summarise(male = sum(male),
    female = sum(female),
    f_pct = ifelse(female == 0, 0, female / (female + male)))

napp_data <- genderdata::napp %>%
  group_by(name) %>%
  summarise(male = sum(male),
    female = sum(female),
    f_pct = ifelse(female == 0, 0, female / (female + male)))

ssa_data <- genderdata::ssa_national %>%
  group_by(name) %>%
  summarise(male = sum(male),
    female = sum(female),
    f_pct = ifelse(female == 0, 0, female / (female + male)))

kantrowitz_data <- genderdata::kantrowitz %>%
  group_by(name) %>%
  summarise(male = sum(gender == "male"),
    female = sum(gender == "female")) %>%
  mutate(f_pct = ifelse(female == 0, 0, female / (female + male)))

ipums_data$data <- "ipums"
napp_data$data <- "napp"
ssa_data$data <- "ssa"
kantrowitz_data$data <- "kantrowitz"
d <- bind_rows(ipums_data, napp_data, ssa_data, kantrowitz_data)

f <- d %>%
  filter(!grepl("[[:punct:]]", name) & grepl("[[:alpha:]]", name) &  !grepl("\\s+", name)) %>%
  group_by(name) %>%
  summarise(male = n_uq(data[male > 0]),
    female = n_uq(data[female > 0]),
    kp = male > 1L | female > 1L) %>%
  ungroup() %>%
  filter(kp)

dd <- filter(d, name %in% f$name)

dd <- dd %>%
  group_by(name) %>%
  summarise(
    female = sum(female, na.rm = TRUE),
    male = sum(male, na.rm = TRUE),
    f_pct = ifelse(female == 0, 0, female / (female + male)))

saveRDS(dd, "all-data.rds")
