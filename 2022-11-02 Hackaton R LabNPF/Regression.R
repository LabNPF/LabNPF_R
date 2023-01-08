
# 1. Linear Regression - TriPM_Total and Diff_LPP_AvgPz_Total ####

Diff_LPP_AvgPz_Total.TriPM_Total.lm <- lm(Diff_LPP_AvgPz_Total~TriPM_Total, data = AvCond_GNG_data)

summary(Diff_LPP_AvgPz_Total.TriPM_Total.lm)

names(Diff_LPP_AvgPz_Total.TriPM_Total.lm)


#1.1. Plot - Linear Regression ####

plot(AvCond_GNG_data$TriPM_Total, AvCond_GNG_data$Diff_LPP_AvgPz_Total, xlab="TriPM Total", ylab = "LPP Average Diff")

abline(Diff_LPP_AvgPz_Total.TriPM_Total.lm, col=4, lwd=3)


#2. Multiple Regression ####

Diff_LPP_AvgPz_Total.Boldness.Meanness.Disinhibition.lm <- lm(Diff_LPP_AvgPz_Total~Boldness+Meanness+Disinhibition, data = AvCond_GNG_data)

summary(Diff_LPP_AvgPz_Total.Boldness.Meanness.Disinhibition.lm)


#2.1. Plot - Multiple Regression ####

#2.1.1. Plot Boldness ####

Diff_LPP_AvgPz_Total.Boldness.lm <- lm(Diff_LPP_AvgPz_Total~Boldness, data = AvCond_GNG_data)

plot(AvCond_GNG_data$Boldness, AvCond_GNG_data$Diff_LPP_AvgPz_Total, xlab="Boldness", ylab = "LPP Average Diff")

abline(Diff_LPP_AvgPz_Total.Boldness.lm, col=2, lwd=3)


#2.1.2. Plot Meanness ####

Diff_LPP_AvgPz_Total.Meanness.lm <- lm(Diff_LPP_AvgPz_Total~Meanness, data = AvCond_GNG_data)

plot(AvCond_GNG_data$Meanness, AvCond_GNG_data$Diff_LPP_AvgPz_Total, xlab="Meanness", ylab = "LPP Average Diff")

abline(Diff_LPP_AvgPz_Total.Meanness.lm, col=3, lwd=3)


#2.1.3. Plot Disinhinibition ####

Diff_LPP_AvgPz_Total.Disinhibition.lm <- lm(Diff_LPP_AvgPz_Total~Disinhibition, data = AvCond_GNG_data)

plot(AvCond_GNG_data$Disinhibition, AvCond_GNG_data$Diff_LPP_AvgPz_Total,  xlab="Disinhibition", ylab = "LPP Average Diff")

abline(Diff_LPP_AvgPz_Total.Disinhibition.lm, col=6, lwd=3)
