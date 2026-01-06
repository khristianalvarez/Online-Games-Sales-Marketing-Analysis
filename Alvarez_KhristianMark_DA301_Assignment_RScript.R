## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team. (Note that you will use basic summary 
## statistics in Module 5 and will continue to go into more detail with descriptive 
## statistics in Module 6.)

################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

################################################################################

# Module 5 assignment: Load, clean and wrangle data using R

## It is strongly advised that you use the cleaned version of the data set that you created and 
##  saved in the Python section of the course. Should you choose to redo the data cleaning in R, 
##  make sure to apply the same transformations as you will have to potentially compare the results.
##  (Note: Manual steps included dropping and renaming the columns as per the instructions in module 1.
##  Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 

## 1. Open your RStudio and start setting up your R environment. 
## 2. Open a new R script and import the turtle_review.csv data file, which you can download from 
##      Assignment: Predicting future outcomes. (Note: You can use the clean version of the data 
##      you saved as csv in module 1, or, can manually drop and rename the columns as per the instructions 
##      in module 1. Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 
## 3. Import all the required libraries for the analysis and view the data. 
## 4. Load and explore the data.
##    - View the head the data.
##    - Create a summary of the new data frame.
## 5. Perform exploratory data analysis by creating tables and visualisations to better understand 
##      groupings and different perspectives into customer behaviour and specifically how loyalty 
##      points are accumulated. Example questions could include:
##    - Can you comment on distributions, patterns or outliers based on the visual exploration of the data?
##    - Are there any insights based on the basic observations that may require further investigation?
##    - Are there any groupings that may be useful in gaining deeper insights into customer behaviour?
##    - Are there any specific patterns that you want to investigate
## 6. Create
##    - Create scatterplots, histograms, and boxplots to visually explore the loyalty_points data.
##    - Select appropriate visualisations to communicate relevant findings and insights to the business.
## 7. Note your observations and recommendations to the technical and business users.

###############################################################################

# Your code here.

# 1. Load and explore the data

# Install and load necessary packages
packages_to_install <- c("tidyverse", "dplyr", "gridExtra", "ggplot2", "car", "moments", "nortest")

# Install packages if not already installed
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) install.packages(new_packages)
}

install.packages("ggplot2")

install_if_missing(packages_to_install)

# Load required libraries
library(ggplot)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(car)
library(moments)
library(nortest)
library(skimr)
library(DataExplorer)
library(Nbclust)
library(factorextra)
library(ggplot2)
# Set the working directory to a specific folder if required
setwd("/Users/chanalvarez/Documents/LSE_DA301_assignment_files_new")

# Read the cleaned Turtle Games data
reviews <- read.csv('reviews.csv', header=T)

# Dropping the review and summary tools
reviews <- subset(reviews, select = -c(review, summary))

# Explore the data

head(reviews)
dim(reviews)
glimpse(reviews)
summary(reviews)
str(reviews)

# Distribution of loyalty points


ggplot(reviews,
       aes(x=loyalty_points))+
  geom_histogram(fill='purple', color='black', bins=20)+
  scale_x_continuous(breaks=seq(0, 7000, 1000), "Loyalty points") +
  scale_y_continuous(breaks=seq(0, 500, 100), "Count of customers") +
  labs(title = "Distribution of Loyalty Points") +
  theme_minimal()


# Distribution of Spending Score
ggplot(reviews,
       aes(x=spending_score)) +
  geom_histogram(fill='yellow', color='black', bins = 20) +
  scale_x_continuous(breaks=seq(0, 100, 10), "Spending Score") +
  scale_y_continuous(breaks=seq(0, 200, 50), "Count of customers") +
  labs(title = "Distribution of Spending Score") +
  theme_minimal()


# Distribution of Age
ggplot(reviews,
       aes(x=age)) +
  geom_histogram(fill='orange', color='black', bins = 20) +
  scale_x_continuous(breaks=seq(0, 80, 10), "Age") +
  scale_y_continuous(breaks=seq(0, 400, 50), "Count of customers") +
  labs(title = "Distribution of Age") +
  theme_minimal()


# Distribution of Gender
ggplot(reviews,
       aes(x=gender)) +
  geom_bar(fill='pink', color='black') +
  scale_y_continuous(breaks=seq(0, 1500, 250), "Count of customers") +
  labs(title = "Distribution of Gender") +
  theme_minimal()


# Distribution of Education
ggplot(reviews,
       aes(x=education)) + 
  geom_bar(fill='red', color='black') +
  scale_y_continuous(breaks=seq(0, 1000, 250), "Count of customers") +
  labs(title = "Distribution of Education") +
  theme_minimal()


# Distribution of Remuneration
ggplot(reviews, 
       aes(x = remuneration)) +
  geom_histogram(fill='lightblue', color='black', bins = 10) +
  scale_x_continuous(breaks=seq(0, 125, 10), "Remuneration") +
  scale_y_continuous(breaks=seq(0, 400, 50), "Count of customers") +
  labs(title = "Distribution of Remuneration") +
  theme_minimal() 


# Most customers hold 750–1,750 loyalty points, with numbers dropping sharply beyond 1,750–2,000.
# Option 1: Continue engaging this group to sustain loyalty growth.
# Option 2: Introduce a tiered rewards system with greater perks at higher point levels.
# Majority earn £35k–£75k, few exceed £80k → focus on mid-range pricing to match spending power.
# Typical spending score: ~50 (±10), showing balanced purchasing behaviour.
# Most customers are aged 35–40, indicating a stable, mature demographic.
# Female customers form the majority, suggesting potential for gender-targeted marketing.
# A plurality hold a university degree, reflecting an informed, value-conscious customer base.


# Cross variable relationships

# Spending Score VS Loyalty Points
ggplot(reviews,
       aes(x = spending_score,
           y = loyalty_points)) + 
  geom_point(color = 'lightgreen',
             alpha = 0.5,  
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              linewidth = 1,
              color = 'black') +
  scale_x_continuous(breaks = seq(0, 100, 10), "Spending score") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  labs(title = "Spending Score vs Loyalty Points") +
  theme_minimal()


# Remuneration VS Loyalty Points
ggplot(reviews,
       aes(x = remuneration,
           y = loyalty_points)) +
  geom_point(color = 'lightblue',
             alpha = 0.5,  
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              linewidth = 1,
              color = 'red') +
  scale_x_continuous(breaks = seq(0, 120, 10), "Remuneration") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty Points") +
  labs(title = "Remuneration vs Loyalty Points") +
  theme_minimal()


# Age VS Loyalty Points
ggplot(reviews,
       aes(x = age,
           y = loyalty_points)) +
  geom_point(color = 'orange',
             alpha = 0.5,  
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              linewidth = 1,
              color = 'red') +
  scale_x_continuous(breaks = seq(0, 100, 10), "Age") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  labs(title = "Age vs Loyalty Points") +
  theme_minimal()



# Relation between Spending Score, Loyalty Points, and Education
ggplot(reviews,
       aes(x = spending_score,
           y = loyalty_points,
           color = education)) +
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 100, 10), "Spending Score") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('lightblue', 'pink', 'yellow', 
                                'red', 'purple')) +
  labs(title = "Relationship between Spending Score, Loyalty Points and Education")



# Relation between Remuneration, Loyalty Points, and Education.
ggplot(reviews,
       aes(x = remuneration,
           y = loyalty_points,
           color = education)) + 
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 120, 25), "Remuneration") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('lightgreen', 'orange', 'purple1', 
                                'yellow', 'pink')) +
  labs(title = "Remuneration vs Loyalty Points by Education")



# Relation between Age, Loyalty Points, and Education
ggplot(reviews,
       aes(x = age,
           y = loyalty_points,
           color = education)) +
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 75, 5), "Age") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('orange', 'magenta', 'yellow', 
                                'lightblue', 'royalblue1')) +
  labs(title = "Relationship between Age, Loyalty Points and Education")



# Relation between Age, Loyalty Points, and Gender
ggplot(reviews,
       aes(x = age,
           y = loyalty_points,
           color = gender)) +
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 75, 5), "Age") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('red', 'lightblue')) +
  labs(title = "Relationship between Age, Loyalty Points and Gender")



# Relation between Spending Score, Loyalty Points, and Gender
ggplot(reviews,
       aes(x = spending_score,
           y = loyalty_points,
           color = gender)) +
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 100, 10), "Spending Score") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('lightgreen', 'blue')) +
  labs(title = "Spending Score vs Loyalty Points by Gender")

  

# Remuneration VS Loyalty Points by Gender
ggplot(reviews,
       aes(x = remuneration,
           y = loyalty_points,
           color = gender)) +
  geom_point(alpha = 0.5, 
             size = 1.5) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              size = 1) +
  scale_x_continuous(breaks = seq(0, 120, 10), "Remuneration") +
  scale_y_continuous(breaks = seq(0, 7000, 1000), "Loyalty points") +
  scale_color_manual(values = c('lightgreen', 'pink')) +
  labs(title = "Remuneration vs Loyalty Points by Gender")


# Female customers generally accumulate more loyalty points than males.
# Older customers tend to earn fewer loyalty points, regardless of gender or education level.
# Among graduates, loyalty points increase slightly with age, while customers with diploma or basic education show a notable decline in accumulation over time.
# Higher spending scores are strongly linked to greater loyalty point totals.
# Higher income also correlates with increased loyalty points, consistent across all education levels and genders


# Clustering with k-means

# Set the working directory to a specific folder if required
setwd("/Users/chanalvarez/Documents/LSE_DA301_assignment_files_new")

# Read the cleaned Turtle Games data
reviews <- read.csv('reviews.csv', header=T)

# Load
reviews <- read.csv("reviews.csv", check.names = TRUE)

# Create a new DataFrame with Remuneration and Spending Score only
reviews1 <- reviews[, c("remuneration", "spending_score")]
head(reviews1)

# Scale the data
rev1_scale <- scale(reviews1)

# View the output
head (rev1_scale)

# Calculate distance metrics between observations
reviews2 <- dist(rev1_scale)

#View the output
head(reviews2)


# Install and load factorextra package
install.packages("factoextra")  # only once
library(factoextra)

# Select the optimal number of clusters (k).
fviz_nbclust(rev1_scale, kmeans, method = "wss") +
  labs(subtitle = "Elbow method")

# Create the model.
model <- kmeans(rev1_scale, centers = 5, nstart = 100)

# View the output.
print(model)


# Visualise the clusters.
fviz_cluster(model, data = rev1_scale) +
  labs(x = "Remuneration", y = "Spending score", subtitle = "5 clusters") +
  theme_minimal()

# Visualise with 4 and 6 clusters as a comparison

# Create the model with 4 clusters.
model_4 <- kmeans(rev1_scale, centers = 4, nstart = 100)

# View the output.
print(model)


# Visualise the clusters.
fviz_cluster(model_4, data = rev1_scale) +
  labs(x = "Remuneration", y = "Spending score", subtitle = "4 clusters") +
  theme_minimal()

# Create the model with 6 clusters.
model_6 <- kmeans(rev1_scale, centers = 6, nstart = 100)

# View the output.
print(model)

# Visualise the clusters.
fviz_cluster(model_6, data = rev1_scale) +
  labs(x = "Remuneration", y = "Spending score", subtitle = "6 clusters") +
  theme_minimal()
  

# Consistent with the Python analysis, five clusters were identified as the optimal number for segmentation.
# These segments should be targeted with tailored marketing strategies and materials aligned with their unique characteristics.
# Each cluster represents a distinct customer group defined by remuneration and spending score.


  
  
  

###############################################################################
###############################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 

################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

################################################################################

## Assignment 6 assignment: Making recommendations to the business.

## 1. Continue with your R script in RStudio from Assignment Activity 5: Cleaning, manipulating, and 
##     visualising the data.
## 2. Load and explore the data, and continue to use the data frame you prepared in Module 5.
## 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
##     review of how customers accumulate loyalty points.
##  - Comment on distributions and patterns observed in the data.
##  - Determine and justify the features to be used in a multiple linear regression model and potential
##.    concerns and corrective actions.
## 4. Create a Multiple linear regression model using your selected (numeric) features.
##  - Evaluate the goodness of fit and interpret the model summary statistics.
##  - Create a visual demonstration of the model
##  - Comment on the usefulness of the model, potential improvements and alternate suggestions that could 
##     be considered.
##  - Demonstrate how the model could be used to predict given specific scenarios. (You can create your own 
##     scenarios).
## 5. Perform exploratory data analysis by using statistical analysis methods and comment on the descriptive 
##     statistics in the context of the review of how customers accumulate loyalty points.
## 6. Document your observations, interpretations, and suggestions based on each of the models created in 
##     your notebook. (This will serve as input to your summary and final submission at the end of the course.)

################################################################################

# Your code here.

# Install the packages
install.packages("psych")
install.packages("moments")
install.packages("dplyr)

#Import the libraries

library(psych)
library(moments)
library(dplyr)

#View the DataFrame
names(reviews)
head(reviews)
dim(reviews)
glimpse(reviews)


# Descriptive stats
summary(reviews)


#Statistical Analysis

#Spending Score

summary(reviews$spending_score)

median(reviews$spending_score)
mean(reviews$spending_score)

min(reviews$spending_score)
max(reviews$spending_score)
range(reviews$spending_score)

quantile(reviews$spending_score, 0.25)
quantile(reviews$spending_score, 0.75)

var(reviews$spending_score)
sd(reviews$spending_score)

hist(reviews$spending_score)
boxplot(reviews$spending_score)

qqnorm(reviews$spending_score)
qqline(reviews$spending_score)

shapiro.test(reviews$spending_score)

skewness(reviews$spending_score)
kurtosis(reviews$spending_score)


# Age

summary(reviews$age)

median(reviews$age)
mean(reviews$age)

min(reviews$age)
max(reviews$age)
range(reviews$age)

quantile(reviews$age, 0.25)
quantile(reviews$age, 0.75)

var(reviews$age)
sd(reviews$age)

hist(reviews$age)
boxplot(reviews$age)

qqnorm(reviews$age)
qqline(reviews$age)

shapiro.test(reviews$age)

skewness(reviews$age)
kurtosis(reviews$age)


# Remuneration

summary(reviews$remuneration)

median(reviews$remuneration)
mean(reviews$remuneration)

min(reviews$remuneration)
max(reviews$remuneration)
range(reviews$remuneration)

quantile(reviews$remuneration, 0.25)
quantile(reviews$remuneration, 0.75)

var(reviews$remuneration)
sd(reviews$remuneration)

hist(reviews$remuneration)
boxplot(reviews$remuneration)

qqnorm(reviews$remuneration)
qqline(reviews$remuneration)

shapiro.test(reviews$remuneration)

skewness(reviews$remuneration)
kurtosis(reviews$remuneration)


# Loyalty Points

summary(reviews$loyalty_points)

median(reviews$loyalty_points)
mean(reviews$loyalty_points)

min(reviews$loyalty_points)
max(reviews$loyalty_points)
range(reviews$loyalty_points)

quantile(reviews$loyalty_points, 0.25)
quantile(reviews$loyalty_points, 0.75)

var(reviews$loyalty_points)
sd(reviews$loyalty_points)

hist(reviews$loyalty_points)
boxplot(reviews$loyalty_points)

qqnorm(reviews$loyalty_points)
qqline(reviews$loyalty_points)

shapiro.test(reviews$loyalty_points)

skewness(reviews$loyalty_points)
kurtosis(reviews$loyalty_points)


# The spending score shows a slight negative skew and a heavy-tailed distribution, indicating a higher likelihood of extreme outliers.
# In contrast, remuneration displays a moderate positive skew and is leptokurtic.
# Loyalty points follow a similar pattern to remuneration, with a positive skew and pronounced leptokurtosis, suggesting an increased probability of extreme positive outliers.


# Multiple Linear Regression

head(reviews)

# Create new DataFrame dropping gender, education and product
reviews3 <- select(reviews, -gender, -education, -product, -review, -summary)

# Check the new DataFrame
head(reviews3)

# Determine the corellation between the variables
cor(reviews3)

# Determine the corellation between the variables
cor(reviews3)

# Visualize the correlation
library(psych)
M <- cor(reviews3, use = "pairwise.complete.obs")
psych::corPlot(M, cex = 1.2)


# Creating the model using independent variables remuneration and spending score
model_a <- lm(loyalty_points ~ remuneration + spending_score, data=reviews3)

# Check the summary stats
summary(model_a)


# Plot actual values and predicted values.

# 1) Install once (if needed)
install.packages("ggplot2")

# 2) Load ggplot
library(ggplot2)
graphics.off()

# 3) Fit the model (make sure model_a exists)
model_a <- lm(loyalty_points ~ age + remuneration + spending_score, data = reviews3)
reviews3$pred <- predict(model_a, reviews3)

# 4) Add predictions, then plot Actual vs Predicted
ggplot(reviews3, aes(x = pred, y = loyalty_points)) +
  geom_point(color = "navyblue", alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  theme_minimal()


#Plot the actual values and predicted values

# Load plotting pkg
library(ggplot2)

# 1) Fit the model
model_b <- lm(loyalty_points ~ age + remuneration + spending_score, data = reviews3)

# 2) Add predictions to the data (clearer than calling predict() inside aes)
reviews3$pred_b <- predict(model_b, newdata = reviews3)

# 3) Plot Actual vs Predicted
ggplot(reviews3, aes(x = pred_b, y = loyalty_points)) +
  geom_point(color = "navyblue", alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    x = "Predicted Loyalty Points",
    y = "Actual Loyalty Points",
    title = "Actual vs Predicted Loyalty Points"
  ) +
  theme_minimal()
  
  
# Use the runif() function to create random data to use as test data

test <- data.frame(age = abs(runif(50, min(reviews$age), max(reviews$age))),
                   remuneration = abs(runif(50, min(reviews$remuneration), max(reviews$remuneration))), 
                   spending_score = abs(runif(50, min(reviews$spending_score), max(reviews$spending_score))))

# View the test data
head(test)


# Predict the loyalty points using the test data
pred <- predict(model_b, newdata = test)
  
# View the output
pred


# The extreme skewness of loyalty points violates the normality assumption.
# This violation reduces the reliability of statistical inference, leading to less accurate standard errors and confidence intervals.
# Linear regression assumes a normal distribution and constant variance in the data.
# To improve future analyses, data transformation should be considered to correct skewness.
# Alternatively, using a non-linear model may provide a better fit for the data.






###############################################################################
###############################################################################




