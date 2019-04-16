library("dbplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
library("tidyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
titanic_original <- read.csv("~/Dropbox/SpringBrd Intro DS/IDS Proj 2/titanic3.csv")
titanic_clean <- titanic_original
titanic_clean$embarked <- str_replace_all(titanic_original$embarked, " ", "S")
mn_age <- round(mean(as.numeric(titanic_clean$age), trim = 0, na.rm = TRUE), 2)
titanic_clean$age <- replace_na(titanic_original$age, mn_age)
titanic_clean$age <- round(titanic_clean$age, digits = 1)
titanic_clean$boat[titanic_clean$boat %in% c('', ' ')] <- NA
titanic_clean$has_cabin_number <- as.integer(titanic_clean$cabin != '')
View(titanic_clean)
write.csv(titanic_clean, "titanic_clean.csv")
