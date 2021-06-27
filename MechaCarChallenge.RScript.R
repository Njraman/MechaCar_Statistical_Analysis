# Importing dplyr libarary
library(dplyr)


# Deliverable 1
# Importing csv file into dataframe
MechaCarMPG <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
# Perform Multiple Linear regression function  
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarMPG)
# Generate p value and r square value using Summary function.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarMPG))


# Deliverable 2
# Importing csv file into dataframe
SuspensionCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# Create Total Summary table
total_summary <- SuspensionCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
# Generate Summary for each manufacturing lot
lot_summary <- SuspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table


#Deliverable 3
#Perform t test to compare PSI across all manufacturing lots with population mean
t.test(SuspensionCoil$PSI,mu=1500)

#Perform t tests to compare the population mean with each lot's mean PSI
#Lot 1
t.test(subset(SuspensionCoil,Manufacturing_Lot =="Lot1")$PSI,mu=1500)
#Lot 2
t.test(subset(SuspensionCoil,Manufacturing_Lot =="Lot2")$PSI,mu=1500)
#Lot 3
t.test(subset(SuspensionCoil,Manufacturing_Lot =="Lot3")$PSI,mu=1500)

