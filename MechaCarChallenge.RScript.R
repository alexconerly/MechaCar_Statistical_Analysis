
#Module 15 Challenge, 

#Deliverable 1:  Linear Regression to Predict MPG

library(tidyr)
df <- read.csv("MechaCar_mpg.csv",check.names=F,stringsAsFactors = F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
                ground_clearance + AWD, data=df)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
             ground_clearance + AWD, data=df))

#Deliverable 2:  Create Visualizations for the Trip Analysis

df2 <- read.table("Suspension_Coil.csv", header=T, sep = ",", check.names=F,
                  stringsAsFactors = F)

total_summary <- summarize(df2, Mean=mean(PSI),
                                    Median=median(PSI),
                                    Variance=var(PSI),
                                    SD=sd(PSI))
lot_summary <- df2 %>% 
              group_by(Manufacturing_Lot) %>%
              summarize(Mean=mean(PSI),
                           Median=median(PSI),
                           Variance=var(PSI),
                           SD=sd(PSI))