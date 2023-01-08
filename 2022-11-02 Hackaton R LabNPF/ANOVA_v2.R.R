#R Script for LabNPF (Hackaton 2022)
#2022-12-02
#
# more info
#
####

#### 1. Installing packages ####

#Install pacman package (Package Manager)
install.packages("pacman")
#Load pacman
library(pacman)
#Install all required packages using pacman function (checks for missing packages and installs them)
p_load(readxl, psych, haven)


#### 2. Set working directory ####

#Define the path to your working directory 
#In Windows: You have to use double \ for the code to work
setwd("C:\\Users\\inesm\\Documents\\FCT PhD\\R Hackaton")

#Alternative: opens a dialogue window for you to select the working directory
#setwd(choose.dir()) #only works on Windows

#### 3. Import data ####

# <- Assigning the content of the csv/xlsx/sav file to the variable test_data

test_data <- read.csv("test_data.csv") #if the data is separated by colons (,) - American style
test_data_pt <- read.csv2("test_data_pt.csv") #if the data is separated by semicolons (;) - Portuguese style

test_data_excel <- readxl::read_excel("test_data_excel.xlsx") #the readxl package is necessary
#the ::readxl is not necessary because we loaded the package, but it is a good practice

AvCond_GNG <- haven::read_sav("AvCond_GNG.sav") #to open SPSS files
#Alternative (opens dialogue window to choose SPSS file): AvCond_GNG <- read_sav(file.choose())

#### 4. Data wrangling ####

# How to use a single variable (column)

# Mean age 
mean(AvCond_GNG$Age)

# Number of values on a given variable
length(AvCond_GNG$Age)

# Standard deviation 
sd(AvCond_GNG$Age)

#Descriptive statistics for one variable
psych::describe(AvCond_GNG$Age)

#We can assign the descriptive statistics to a new object and have a nice table
age_descriptives <- psych::describe(AvCond_GNG$Age)
print(paste0("The mean age of the sample is ", round(age_descriptives$mean,2), ".")) #the round function reduces the number of decimals

#See column names and row names
colnames(AvCond_GNG)
rownames (AvCond_GNG)
#you can specify a specific variable
colnames(AvCond_GNG) [1]

#Creating descriptive statistics by sex (TriPM Total Score)
psych::describeBy(AvCond_GNG$TriPM_Total, group = AvCond_GNG$Gender)

#Select subsets of cases (i.e., filter the data)
subset(AvCond_GNG, AvCond_GNG$Gender == "M")

#Creating a new data set with only the males
AvCond_GNG_only_M <- subset(AvCond_GNG, AvCond_GNG$Gender == "M")

# Factors (a variable that is categorical)
class(AvCond_GNG$Gender) #to check the type of variable
#as.factor(AvCond_GNG$Gender)
AvCond_GNG$Gender_factor <- as.factor(AvCond_GNG$Gender) #the variable was in character, this function turns it into a (new) categorical variable


####################################################################################################
#### One-Way ANOVA ####
#In this example we will compare four groups on their total TriPM score.

#Install all required packages using pacman function (checks for missing packages and installs them)

p_load(ggplot2, car)

#Transforming a continuous variable into a categorical variable"

AvCond_GNG$Age_groups <- cut(AvCond_GNG$Age, breaks=c(19, 22.5, 25, 29.5, 46),labels=c("Age1", "Age2", "Age3", "Age4"))
#check if variable was created as categorical
class(AvCond_GNG$Age_groups)

#Descriptive Statistics

#TriPM (total Sample)
psych::describe(AvCond_GNG$TriPM_Total)

#TriPM by groups
TriPM_Group <- psych::describeBy(AvCond_GNG$TriPM_Total, group = AvCond_GNG$Age_groups)

#Visualize your data
boxplot(AvCond_GNG$TriPM_Total ~ AvCond_GNG$Age_groups,
        data = AvCond_GNG,
        main = "Title",
        xlab = "x title",
        ylab = "y title",
        col = "steelblue",
        border = "black")

#One-Way ANOVA

res.aov <- aov(AvCond_GNG$TriPM_Total ~ AvCond_GNG$Age_groups, data = AvCond_GNG)
ANOVA <- summary(res.aov) #summary table

#Pairwise Comparisons (choose between Tukey and Bonferroni)

#Tukey
#diff: difference between means of the two groups
#lwr, upr: the lower and the upper end point of the confidence interval at 95% (default)
#p adj: p-value after adjustment for the multiple comparisons.
TukeyHSD(res.aov)


#Bonferroni
#pairwise.t.test(AvCond_GNG$TriPM_Total, AvCond_GNG$Age_groups, p.adjust.method = "bonferroni")

# Assumption 1: Variable type

class(AvCond_GNG$TriPM_Total) #one continuous quantitative (numeric) variable, DV
class(AvCond_GNG$Age_groups) #one qualitative (factor), categorical, IV


# Assumption 2: Homogeneity of variance 

#Residuals vs Fitted
ResidualsFitted <- plot(res.aov, 1)

#conduct Levene's Test for equality of variances (Homogeneity)
leveneTest(AvCond_GNG$TriPM_Total ~ AvCond_GNG$Age_groups, data = AvCond_GNG)


# Assumption 3: Normality

#Q-Q Plot
NormalQ_Q <- plot(res.aov, 2)

#Extract Residuals
aov_residuals <- residuals(object = res.aov)

#Run Shapiro-Wilk test
shapiro.test(x = aov_residuals)

#Checking Skewness and Kurtosis of TriPM by group
TriPM_Group[["Age1"]]$skew
TriPM_Group[["Age1"]]$kurtosis

TriPM_Group[["Age2"]]$skew
TriPM_Group[["Age2"]]$kurtosis

TriPM_Group[["Age3"]]$skew
TriPM_Group[["Age3"]]$kurtosis

TriPM_Group[["Age4"]]$skew
TriPM_Group[["Age4"]]$kurtosis


     