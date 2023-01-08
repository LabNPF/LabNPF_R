#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
#
#
#R script for Labnpf Hackaton 2022
#2022-12-02
# 
# (... add names and more stuff)
#
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#1. Load pacman package Manager and then all required packages ####

library(pacman)
p_load(readxl, psych, haven)

#2. Set working directory, where data and script should be ####

## set wd via paht
setwd("C:\\Users\\prune\\OneDrive\\Documentos\\PDN\\Hackaton R\\Analysis Folder")

## set wd via dialog
setwd(choose.dir())

# clear all variables
rm(list = ls())


#3. Import data ####

# Import American-style csv
test_data = read.csv("test_data.csv")

# Import Portuguese-style csv
test_data_pt = read.csv2("test_data_pt.csv")

# Import Excel sv
test_data_excel = read_excel("test_data_excel.xlsx")

# Import SPSS
AvCond_GNG_data = read_sav("AvCond_GNG.sav")
AvCond_GNG = read_sav(file.choose())

#4. Data wrangling ####

# How to use a single variable (column)
length(AvCond_GNG_data$Age)
mean(AvCond_GNG_data$Age)
sd(AvCond_GNG_data$Age)

psych::describe(AvCond_GNG_data$Age)

age_descriptives = describe(AvCond_GNG_data$Age)

print(paste0("The mean age of the sample is", round(age_descriptives$mean, 1),"."))

# See column names and row names
colnames(AvCond_GNG_data)
rownames(AvCond_GNG_data)

psych::describe(AvCond_GNG_data$TriPM_Total)

psych::describeBy(AvCond_GNG_data$TriPM_Total, group=AvCond_GNG_data$Gender)

# Select subsets of cases (i.e., filter the data)
AvCond_GNG_data_onlyM = subset(AvCond_GNG_data, AvCond_GNG_data$Gender == "M")

#Factors
is.factor(AvCond_GNG_data$Gender) #confirms if variable is a factor
as.factor(AvCond_GNG_data$Gender) #converting for temporary use as a factor

AvCond_GNG_data$GenderFactor = as.factor(AvCond_GNG_data$Gender)

table(AvCond_GNG_data$GenderFactor) #for factor variables


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#5. T-Test####


#5.1 One sample t-test####
t.test(AvCond_GNG_data$Age, mu = 20) #test if mean is equal to mu
t.test(AvCond_GNG_data$Age, mu = 30, alternative = "greater") #test if mean is greater then mu
t.test(AvCond_GNG_data$Age, mu = 30, alternative = "less") #test if mean is less then mu

#5.2 Non -parametric test Mann-Whitney####
wilcox.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender)


#5.3 Independent Two sample t-test####
var.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender) #if p-value less than 0.05, variances are unequal
t.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender, var.equal = TRUE) #if variances equal
t.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender, var.equal = FALSE) #if variances unequal



var_test_pvalue <- var.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender)$p.value

if (var_test_pvalue>0.05)
{
  print ('variances equal')
  t.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender, var.equal = TRUE)
}else{
  print ('variances unequal')
  t.test(AvCond_GNG_data$Age ~ AvCond_GNG_data$Gender, var.equal = FALSE)
}

#5.4 Dependent Two sample t-test ####
t.test(AvCond_GNG_data$AC_LPP_Aversive_AvgPZ, AvCond_GNG_data$AC_LPP_NonAversive_AvgPZ, paired = TRUE)


#5.5 Plots

colors <- c("light green","pink")
means <- psych::describeBy(AvCond_GNG_data$Age, group=AvCond_GNG_data$Gender)

means$F['mean']
barplot(c(means$F['mean']$mean, means$M['mean']$mean),
        ylim=c(0,30),
        main = 'Age per Gender', names.arg=c('F', 'M'), col.main = "black",
        xlab="Gender",
        ylab="Mean Age", col = colors
        )
