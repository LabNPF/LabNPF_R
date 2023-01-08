############################################################################

# R script for the LabNPF hackaton 2022
#02-12-2022

############################################################################

#load pacman Package Maneger for R and then all 

library(pacman)

p_load(readxl,psych)

p_load(readxl,psych,haven)

# importar a base SPSS atraves do codigo do diretorio.


#set WD via path

setwd("C:\\Users\\gandr\\OneDrive - Universidade do Porto\\PhD\\Aulas PhD 5º ano\\R Hackathon\\Analysis folder")

#Set Wd via dialog

setwd(choose.dir()) # run e escolher o ficheiro; only for windows

#3. Import data ***

#import amercian-style cvs (separator is ,)
text_data <- read.csv("text_data.csv")

# Import Portuguese/European-style cvs (separator is ;)
test_data_pt <- read.csv2("test_data_pt.csv")

# Import From Excel
test_data_excel <- readxl::read_excel("test_data_excel.xlsx")

# Import from SPSS
AvCond_GNG <- read_sav("AvCond_GNG")

AvCond_GNG <- read_sav(file.choose("C:\\Users\\gandr\\OneDrive - Universidade do Porto\\PhD\\Aulas PhD 5º ano\\R Hackathon\\Analysis folder\\AvCond_GNG.sav")) #outra forma de ir buscar o ficheiro SPSS


#4. Data wrangling 
# How to use a single variable (column)
length(AvCond_GNG$Age)

mean(AvCond_GNG$Age)

sd(AvCond_GNG$Age)

psych::describe(AvCond_GNG$Age)

age_descriptives <- psych::describe(AvCond_GNG$Age)

print(paste("The mean age of the sample is", age_descriptives$mean, "."))

# Getting (and setting) names of variables (column) and cases (rows)
colnames(AvCond_GNG)

rownames(AvCond_GNG)

psych::describe(AvCond_GNG$TriPM_Total)

psych:: describeBy(AvCond_GNG$TriPM_Total, group=AvCond_GNG$Gender)

#select subsets of cases (i.e., filter the data)

subset(AvCond_GNG, AvCond_GNG$Gender == "M")

AvCond_GNG_onlyM <- subset(AvCond_GNG, AvCond_GNG$Gender == "M")

# Factors
AvCond_GNG$Gender

as.factor(AvCond_GNG$Gender)

is.factor(AvCond_GNG$Gender) 

AvCond_GNG$GenderFactor <- as.factor(AvCond_GNG$Gender)

table(AvCond_GNG$Gender)

table(AvCond_GNG$GenderFactor)


# Perform Chi Square test.

mean(AvCond_GNG$TriPM_Total)

AvCond_GNG$TripM_Cat <- ifelse(AvCond_GNG$TriPM_Total < 54,1,0)

chisq.test(AvCond_GNG$TripM_Cat, AvCond_GNG$Gender, correct = FALSE)

table(AvCond_GNG$TripM_Cat, AvCond_GNG$Gender)

results <- chisq.test(AvCond_GNG$TripM_Cat, AvCond_GNG$Gender, correct = FALSE)

(results)

names(results)


# Perform Mann W. test.
res <- wilcox.test(AvCond_GNG$TriPM_Total~AvCond_GNG$Gender, 
                   data = AvCond_GNG, exact = FALSE)

(res)

# Boxplot Mann W test
boxplot(AvCond_GNG$TriPM_Total~ AvCond_GNG$Gender)

# save boxplot
jpeg(file="saving_plot1.jpeg")
boxplot(AvCond_GNG$TriPM_Total~ AvCond_GNG$Gender)
dev.off()


pdf(file="saving_plot1.pdf")
boxplot(AvCond_GNG$TriPM_Total~ AvCond_GNG$Gender)
dev.off()
