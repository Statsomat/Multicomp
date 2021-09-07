#####################################
# Expected tables for a one-way model 
#####################################
library(data.table)
library(multcomp)
library(car)
library(sandwich)


df_factorized <- fread("Datasets/warpbreaks.csv", data.table = FALSE)
df_factorized$tension <- as.factor(df_factorized$tension)
df_factorized[,4] <- relevel(df_factorized[,4], ref = "L")
modelfunction <- "breaks ~ tension"
lmfit <- lm(modelfunction, data = df_factorized)
summary(lmfit)
for (i in 1:ncol(df_factorized)) {
  if (is.factor(df_factorized[,i])==T) contrasts(df_factorized[,i]) <- contr.sum
}
Anova(lmfit, type=3)
hov(as.formula(modelfunction), data = df_factorized)

## Dunnet
dunnet <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = "two.sided")
summary(dunnet)
confint(dunnet, level = 0.95)

## Dunnet Step-Down 
### For Hypothesis satisfying the free combination condition, for many-to-one valid 
### More powerful 
summary(dunnet, test = adjusted(type = "free"))

## Dunnet Sandwich
dunnet_sandwich <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = "two.sided", vcov = sandwich)
summary(dunnet_sandwich)
confint(dunnet_sandwich, level = 0.95)


## Dunnet Sandwich Step-Down 
summary(dunnet_sandwich, test = adjusted(type = "free"))






#####################################
# Expected tables for a two-way model with interaction
#####################################
df_factorized <- fread("Datasets/warpbreaks.csv", data.table = FALSE)
df_factorized$tension <- as.factor(df_factorized$tension)
df_factorized[,4] <- relevel(df_factorized[,4], ref = "L")
modelfunction <- "breaks ~ tension*wool"
lmfit <- lm(modelfunction, data = df_factorized)
summary(lmfit)
for (i in 1:ncol(df_factorized)) {
  if (is.factor(df_factorized[,i])==T) contrasts(df_factorized[,i]) <- contr.sum
}
Anova(lmfit, type=3)
leveneTest(as.formula(modelfunction), data = df_factorized)

## Dunnet
dunnet <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = "two.sided")
summary(dunnet)
confint(dunnet, level = 0.95)

## Dunnet Step-Down 
### For Hypothesis satisfying the free combination condition, for many-to-one valid 
### More powerful 
summary(dunnet, test = adjusted(type = "free"))

## Dunnet Sandwich
dunnet_sandwich <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = "two.sided", vcov = sandwich)
summary(dunnet_sandwich)
confint(dunnet_sandwich, level = 0.95)


## Dunnet Sandwich Step-Down 
summary(dunnet_sandwich, test = adjusted(type = "free"))








#####################################
# Expected tables for a two-way model without interaction, alternative=less
#####################################
df_factorized <- fread("Datasets/warpbreaks.csv", data.table = FALSE)
df_factorized$tension <- as.factor(df_factorized$tension)
df_factorized[,4] <- relevel(df_factorized[,4], ref = "M")
modelfunction <- "breaks ~ wool+ tension"
lmfit <- lm(modelfunction, data = df_factorized)
sumi <- summary(lmfit)
for (i in 1:ncol(df_factorized)) {
  if (is.factor(df_factorized[,i])==T) contrasts(df_factorized[,i]) <- contr.sum
}
Anova(lmfit, type=3)
leveneTest(as.formula(modelfunction), data = df_factorized)

## Dunnet
side <- "greater"
dunnet <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = side)
summary(dunnet)
confint(dunnet, level = 0.95)

## Dunnet Step-Down 
### For Hypothesis satisfying the free combination condition, for many-to-one valid 
### More powerful 
summary(dunnet, test = adjusted(type = "free"))

## Dunnet Sandwich
dunnet_sandwich <- glht(lmfit, linfct = mcp(tension = "Dunnett"), alternative = side, vcov = sandwich)
summary(dunnet_sandwich)
confint(dunnet_sandwich, level = 0.95)


## Dunnet Sandwich Step-Down 
summary(dunnet_sandwich, test = adjusted(type = "free"))
