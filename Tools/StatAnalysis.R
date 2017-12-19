#---------------------------------------------------------------------------------------------------

# Load required packages.
library("AlgDesign")
library("DoE.base")
library("FrF2")
library("lestat")

#---------------------------------------------------------------------------------------------------
## Read data and save relevant variables.
cat_data = read.csv("exruns.csv")
m = matrix(scan("exruns.dat"),ncol=7,byrow=T)

travel = m[,6]
order = m[,7]

## Declare variables as factors.
angle = as.factor(m[,2])
srate = as.factor(m[,3])
pull = as.factor(m[,4])
mass = as.factor(m[,5])

## Save numeric variables and interactions. (Version only includes 2-way interactions)
a = m[,2]
b = m[,3]
c = m[,4]
d = m[,5]
cd = c*d
bc = b*c
bd = b*d
ab = a*b
ac = a*c
ad = a*d

df = data.frame(angle,srate,pull,mass,travel,order,a,b,c,d,cd,bc,bd,ab,ac,ad)
#---------------------------------------------------------------------------------------------------
# Generate plots for analysis.
par(bg=rgb(1,1,0.8), mfrow=c(2,2))
# Normal Probability Plot
qqnorm(travel)
qqline(travel, col = 2)
boxplot(travel, horizontal=TRUE, main="Box Plot", xlab="Travel")
# Histogram of response variable.
hist(travel, main="Histogram", xlab="Travel")
# Response vs Run Order. Note: Run-order plot does not indicate a significant time effect. 
plot(order, travel, xlab="Actual Run Order", ylab="Travel",
     main="Run Order Plot")
par(mfrow=c(1,1))

# Boxplots of response variable for each factor. 
par(bg=rgb(1,1,0.8),mfrow=c(2,3))
boxplot(travel~angle, data=df, main="Travel by Angle",
        xlab="Angle",ylab="Travel")
boxplot(travel~srate, data=df, main="Travel by Spring Rate",
        xlab="Spring Rate",ylab="Travel")
boxplot(travel~pull, data=df, main="Travel by Pull Distance",
        xlab="Pull Distance",ylab="Travel")
boxplot(travel~mass, data=df, main="Travel by Mass",
        xlab="Mass",ylab="Travel")
par(mfrow=c(1,1))
#---------------------------------------------------------------------------------------------------
## Fit a model with up to third order interactions.
q = aov(travel~(angle+srate+pull+mass)^3,data=df)
qsum <-summary(q)





















