
#Module 15 Challenge, 

#DELIVERABLE 1:  Linear Regression to Predict MPG

library(dplyr)
df <- read.csv("MechaCar_mpg.csv",check.names=F,stringsAsFactors = F)

mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
                ground_clearance + AWD, data=df)

summary(mecha_lm)




#DELIVERABLE 2:  Create Visualizations for the Trip Analysis

df2 <- read.table("Suspension_Coil.csv", header=T, sep = ",", check.names=F,
                  stringsAsFactors = F)

total_summary <- df2 %>% summarize(Mean=mean(PSI),
                                   Median=median(PSI),
                                   Variance=var(PSI),
                                   SD=sd(PSI))
lot_summary <- df2 %>% 
  group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),
            Median=median(PSI),
            Variance=var(PSI),
            SD=sd(PSI),
            .groups='keep')

#DELIVERABLE 3: T-Tests on Suspension Coils

# Perform t-test across all Lots
t.test(df2$PSI, mu=1500)

#Perform t-test on lot1
t.test(subset(df2,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
#Perform t-test on lot2
t.test(subset(df2,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
#Perform t-test on lot3
t.test(subset(df2,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

