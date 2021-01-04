# MechaCar_Statistical_Analysis


## Overview of the Project

The purpose of this project was to utilize R programming language and Rstudio GUI to aid a fictitious company called AutosRU in performing statistical tests on their datasets for a prototype vehicle called "MechaCar".  In essense, the prototype was suffering from production troubles and needed insights to help the manufacturing team with some data analyses.  The statistical tests included summary statistics, visualizations, and a variety of hypothesis testing procedures on the company-specific datasets.  Below, there are three sets of analyses described in detail followed by an additional statistical study design to compare performance of the MechaCar vehicles against performance of vehicles from other manufacturers.

---------------------------------------------
## Resources:

Data Sources: 

    MechaCar_mpg.csv
    Suspension_Coil.csv

Software: 

    R 4.0.3, Rstudio 1.3.1093, 
    Visual Studio Code 1.49.2

--------
## Linear Regression to Predict MPG

From the MechaCar_mg dataset, a variety of questions were addressed by linear regression to predict mpg.  A summary of these questions, their corresponding answers, and images of the R script code and console results are provided for illustration below.

### Questions Addressed:
Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset? Is the slope of the linear model considered to be zero? Does this linear model predict mpg of MechaCar prototypes effectively?

### Results:
Using the Tidyr package's linear model function along with the summary method in R, the desired statistical summaries were easily obtained using the following codes.  

![](Resources/Deliv1_sourcep.png)

Firstly, some variables/coefficients did provide a non-random amount of variance to the mpg values in the dataset.  In particular, vehicle Length and ground clearance were statistically significant as their p-values fell below the .05 significance level (alpha).  Additionally, it may be worth noting that the y-intercept was also statistically significant, meaning there are other variables and factors that may contribute to the variation in mpg values that were not included in the model.

The slope of the linear model is not zero, according to the statistical summary results. Assuming we have a confidence level of 95%, the p-value is far below the corresponding .05 significance level and, therefore, we have sufficient statistical reasoning to reject the null hypothesis that the slope is zero.  Lastly, regarding the predictive capability of the model, this linear model does indeed predict mpg of MechaCar prototypes fairly well considering the coefficient of determination (r-squared) produced a value of 0.7149.  This means that the linear model explains about 71 percent of the variability, indicating our model does a decent job of predicting our dependent variable (mpg).

![](Resources/Deliv1_console.png)

---------------------------

## Summary Statistics on Suspension Coils

From the "Suspension_Coil.CSV" dataset, questions were addressed that involved fiinding summary statistics on suspension coils.  The findings and illustrative images of the R script and console results are provided below:

### Questions Addressed:
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually?

### Results:
From utitlizing "group by" and "summarize" methods in R, the variance, as well as a variety of other statistical metrics were easily calculated for the PSI overall totals as well as the PSI grouped for each manufacturing lot in the dataset.  To calculate these metrics, including the determination of whether the design specifications for the MechaCar suspension coils were within range, the following codes were run in R:

![](Resources/Deliv2_srcp.png)



According to the first resulting "total_summary" table, the variance in PSI for all manufacturing lots as a whole appears within the desired range of 100 pounds per square inch (or less) with a value of approximately 62.29.

![](Resources/deliv2_total.png)

However, when we examine the variance in PSI grouped by each of the three lots in the "lot_summary" table, we find that not all of the results are within specifications.  In particular, lot 3 exhibited a variance far above the 100 limit with a value of 170.29.

![](Resources/deliv2_lots.png)

--------------------


## T-Tests on Suspension Coils

Still using the "Suspension_Coil.CSV" dataset, t-tests were performed to address questions about PSI as a whole and for each lot.  A summary of these questions, their corresponding answers, and images of the R script code and console results are provided for illustration below.

### Questions Addressed:
Are all manufacturing lots (as a whole) statistically different than a population mean of 1,500 pounds per square inch?  What about each lot individually?

### Results:

To perform the t-tests using R, first the t.test method was utilized to compare all lots against a population mean of 1,500 pounds per square inch.  Following this, the t.test method for each lot was subsetted according to lot number in the t.test method as seen below.

![](Resources/Deliv3_srcpane.png)

From the t-test to compare all lots against the population mean of 1,500 we can see that the sample mean was 1498.78 and the p-value is 0.06028.  Although the p-value is low, it is not low enough to reject the null hypothesis that the population's true mean is 1,500 because it did not fall below the significance level of 0.05 (see image below).

![](Resources/Deliv3_alllots.png)

Finally, the t-test to compare each lot produced varying results for each lot.  For lot 1, the mean was exactly 1,500 and so the p-value was exactly 1.  This is a perfect match to the population mean and is therefore not statistically significant as there was no difference betwen the two.  For lot 2, the mean was 1,498.78 with a p-value of 0.06.  Although low, this p-value is also not statistically different enough to reject the null hypothesis.  However, lot 3 had a mean of 1,496.14 and a the p-value of 0.04168.  Therefore, unlike the other two lots, lot 3 is statistically different from the population mean since its p-value is below 0.05.

![](Resources/Deliv3_eachlot.png)

-----------------
## Study Design: MechaCar vs Competition

To further aid AutosRU in improving their MechaCar prototype for maximal performance against the competition, designing another study may be worth further analysis to compare metrics with competitors.  In this study design, the MechaCar data could be analyzed against one or more competitor's comparable data to highlight a variety of metrics which may be of interest to potential consumers.

For example, the mean from a sample of the highway fuel efficiency (measured in mpg)of MechaCar data could be compared against the mean of a sample from the competitor's highway efficiency to determine if there is any statistical difference.  One way to conduct this statistical study could involve using a two-sample t-test where we would set the null hypothesis to be that there is no statistical difference between a sample of MechaCar's highway fuel efficiency and the mean of a sample of a competitor's highway fuel efficiency.  In contrast, the alternative hypothesis would be that there is a statistical difference.  The two-sample t-test would test whether the p-value from the t-test was below a predetermined significance level.  

To perform the two-sample t-test, we would need a dataset population for both AutosRU's MechaCar's highway fuel efficiency as well as the competitor's for the same efficiency metric.  From each population, we could use the sample_n() in R to select a large enough sample from each population and assign them to separate variables.  Then we could check to ensure each sample is normally distributed using the Shapiro-Wilk test.  If there are normality issues such as outliers skewing the normal distribution we could try log transforming the data.  We also want to ensure the input data is numerical, continuous and the variance is similar.  Finally, we can perform the two-sample t-test in R and observe the results.

Assuming a confidence level of 95%, if the results indicate that the p-value is above 0.05, then the MechaCar's metric is not statistically significant and, therefore, we would not reject the null hypothesis.  Since the ultimate goal here would be to discern how the MechaCar fares against the competition, this would indicate that perhaps the MechaCar is on par with the competitor's mean in fuel efficiency.  However, if the p-value is below 0.05 this would provide evidence that the MechaCar's fuel efficiency is either significantly below the competition or above the competition, depending on the mean value.  Hence, this statistical test could provide great insight into whether this particular metric may be stagnating the MechaCar's success.


