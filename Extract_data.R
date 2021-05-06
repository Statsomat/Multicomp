
library(multcomp)
library(ISwR)
library(MASS)
library(datasets)
library(TH.data)
library(coin)
library(survival)
library(DoseFinding)

# Dataset recovery.csv, page 70
## Factor: blanket 
## Ref: b0
data("recovery", package = "multcomp")
write.csv(recovery, file="recovery.csv")

## Dataset Thuesen, page 3
## Cont: blood.glucose, short.velocity 
data("thuesen", package="ISwR")
write.csv(thuesen, file = "thuesen.csv")

## Dataset warpbreaks, page 53
## cont: breaks	The number of breaks
## factor: wool	The type of wool (A or B)
## factor: tension The level of tension (L, M, H)
## breaks ~ wool + tension \n tension \M
## break ~ wool 
## break ~ tension 
## break ~ wool|tension 
data("warpbreaks", package="datasets")
write.csv(warpbreaks, file="warpbreaks.csv")

## Dataset immer, page 82
## Char: Loc, Var
## cont: Y1, Y2
data("immer", package="MASS")
write.csv(immer, file="immer.csv")

## Dataset litter, page 101
## Factor: dose
## cont: weight, gesttime, number
data("litter", package = "multcomp")
write.csv(litter, file="litter.csv")

## Dataset bodyfat, page 108
## cont: age, DEXfat, waistcirc, hipcirc, elbowbreadth,
##        kneebreadth, anthro3a, anthro3b, anthro3c, anthro4
data("bodyfat", package = "TH.data")
write.csv(bodyfat, file="bodyfat.csv")

## Dataset sbp, page 113
## Char: gender 
## cont: sbp (systolic blood pressure), age
data("sbp", package = "multcomp")
write.csv(sbp, file="sbp.csv")

## Dataset alpha, page 115
## Factor: alength
## cont: elevel
data("alpha", package = "coin")
write.csv(alpha, file="alpha.csv")

## Dataset alzheimer, page 119
## Factor: smoking, disease, gender
data("alzheimer", package = "coin")
write.csv(alzheimer, file="alzheimer.csv")

## Dataset clinical??? 

## Dataset trees513, page 125
## Factor: damage, species, lattice, plot
data("trees513", package = "multcomp")
write.csv(trees513, file="trees513.csv")

## Dataset adevent, page 137
## Factor: E1, E2, ..., E28, group
data("adevent", package = "multcomp")
write.csv(adevent, file="adevent.csv")

## Dataset mtept, page 139
## Factor: treatment
## cont: E1, E2, E3, E4
data("mtept", package = "multcomp")
write.csv(mtept, file="mtept.csv")


## Dataset biom, page 163
## cont: resp, dose
data("biom", package = "DoseFinding")
write.csv(biom, file="biom.csv")
