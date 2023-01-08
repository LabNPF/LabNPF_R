# R script for the LABNPF Hackathon 2022
# 2022 - 12 - 02
# could add more info here

# 1. Load pacman package manager and then all required packages ####

library(pacman)

p_load(readxl,psych,haven)

setwd("C:\\Users\\catgi\\OneDrive\\Ambiente de Trabalho\\LabNPF_Hackathon2022")

# 2. to find work directory - manually just copy the directory from the folder ####

dir("C:\\Users\\catgi\\OneDrive\\Ambiente de Trabalho\\LabNPF_Hackathon2022")

# we can also use setwd(choose.dir()) but it is very difficult

# 3. Import data ####

# american style .csv - this has ,
test_data <- read.csv("test_data.csv")

# european style .csv - this has ;
test_data_pt <- read.csv2("test_data_pt.csv")

# we can use read_excel; if not load readxl then nop; import from excel
test_data_excel <- read_excel("test_data_excel.xlsx")

# import from SPSS

AvCond_GNG_data <- read_sav("AvCond_GNG.sav")

#OR

#AvCond_GNG_data <- read_sav(file.choose())


# 4. Data wrangling ####

#How to use single variable (column)

mean(AvCond_GNG_data$Age)
length(AvCond_GNG_data$Age)
sd(AvCond_GNG_data$Age)

# shows all the parameters we want without having to ask each one
psych::describe(AvCond_GNG_data$Age)

age_descriptives <- psych::describe(AvCond_GNG_data$Age)

print(paste0("The mean age of the sample is ", age_descriptives$mean, "."))

colnames(AvCond_GNG_data) #used to get information of name of columns

psych::describe(AvCond_GNG_data$TriPM_Total) #get descriptive

psych::describeBy(AvCond_GNG_data$TriPM_Total, group=AvCond_GNG_data$Gender)

# Select subsets of cases (i.e filter data)

AvCond_GNG_data_onlyM <- subset(AvCond_GNG_data, AvCond_GNG_data$Gender == "M")

# Factors - categorical variable

AvCond_GNG_data$Gender
as.factor(AvCond_GNG_data$Gender)
factor(AvCond_GNG_data$Gender)
AvCond_GNG_data$GenderFactor <- as.factor(AvCond_GNG_data$Gender)

# if we have categorical data table will give frequencies

table(AvCond_GNG_data$GenderFactor)

colnames(AvCond_GNG_data)[1]
colnames(AvCond_GNG_data)[1] <- "ParticipantNumber"

# Exercise ####

#Correlation


#Defining variables

#correlation
cor.test(AvCond_GNG_data$Boldness, AvCond_GNG_data$Anx_Cognitive_T)

corr_boldness_ax_cognitive <- cor.test(AvCond_GNG_data$Boldness, AvCond_GNG_data$Anx_Cognitive_T)
corr_boldness_ax_cognitive
names(corr_boldness_ax_cognitive) #dimensions variable

corr_boldness_ax_cognitive$statistic
corr_boldness_ax_cognitive$parameter
corr_boldness_ax_cognitive$estimate

cor.test(AvCond_GNG_data$Boldness, AvCond_GNG_data$Anx_Somatic_T)

# Reliability
#transform all items into one

boldness_items <- data.frame(AvCond_GNG_data$TriPM01,
                    AvCond_GNG_data$TriPM04_R,
                    AvCond_GNG_data$TriPM07,
                    AvCond_GNG_data$TriPM10_R,
                    AvCond_GNG_data$TriPM13,
                    AvCond_GNG_data$TriPM16_R,
                    AvCond_GNG_data$TriPM19,
                    AvCond_GNG_data$TriPM22,
                    AvCond_GNG_data$TriPM25_R,
                    AvCond_GNG_data$TriPM28,
                    AvCond_GNG_data$TriPM32,
                    AvCond_GNG_data$TriPM35_R,
                    AvCond_GNG_data$TriPM38,
                    AvCond_GNG_data$TriPM41_R,
                    AvCond_GNG_data$TriPM44_R,
                    AvCond_GNG_data$TriPM47_R,
                    AvCond_GNG_data$TriPM50_R,
                    AvCond_GNG_data$TriPM54,
                    AvCond_GNG_data$TriPM57_R)
#run alpha
psych::alpha(boldness_items)

# Plot - if error: figure too big, do par("mar"), and after par(mar=c(1,1,1,1)) on console

plot(AvCond_GNG_data$Boldness, AvCond_GNG_data$Anx_Cognitive_T)


