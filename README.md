# Advanced Analytics for Organizational Impact

### Topics Covered

Data Wrangling, Data Visualisation with Python and R, Python for Advanced Analytics (scipy, statsmodels, and scikit-learn), R (tidyverse, dplyr, ggplot2), Linear Regression, Multiple Linear Regression, Logistic Regression, K-means Clustering, Natural Language Processing, Sentiment Analysis.


#### *Grade: Distinction*

## Project Scope


Turtle Games is a global manufacturer and retailer of board games, video games, and toys. The goal of the company is to enhance its sales performance by leveraging insights from its robust data collection system, which comprises information from its customer accounts and reviews. This project looks into the customer demographics and sales-related data to uncover patterns in loyalty accumulation, identify key market segments, assess the influence of customer feedback, and evaluate reliability. 


## Analytical Approach


The initial phase of the analysis on the turtle_reviews.csv dataset was conducted in Python using Jupyter Notebook. All imported data sets were cleaned through sense-checking data types, finding missing values, and detecting duplicates. An examination of the descriptive statistics for the metadata was also observed to provide an overview of the dataset’s structure and distribution. The analysis utilized several key libraries such as NumPy, Pandas, Matplotlib, Seaborn, SciPy, Statsmodels, and Scikit-learn in Python. 


Further exploration in R was employed during the second phase of the data analysis, where Tidyverse, Dplyr, Ggplot2, Skimr, DataExplorer, NbClust, FactorExtra, Psych, and Moment were all utilized to investigate the distribution and relationship of the variables. Subsequent visualizations were then developed through histograms and scatterplots to illustrate these links. A disaggregation of data was also performed to analyze the data according to categorical values, specifically gender and education level, to uncover potential group-level variations. 



### *Data Analysis in Python*

Prior to using the Multiple Linear Regression model, individual simple linear regressions were first conducted for each independent variable against Loyalty Points. 


<img width="255" height="179" alt="image" src="https://github.com/user-attachments/assets/691ac35b-acb7-4dac-8328-7276351e907d" />


<img width="255" height="177" alt="image" src="https://github.com/user-attachments/assets/e18a15a7-48a9-4b41-aae0-c53f96568ce5" />


<img width="266" height="187" alt="image" src="https://github.com/user-attachments/assets/99b6c6cf-8a56-4f37-b9c2-558f652ef644" />


These regression models indicate that spending score, remuneration, and age explain approximately 45%, 38%, and 0.02% of the variation in the loyalty point accumulation, respectively. Based on these results, a one-unit increase in spending score, or remuneration corresponds to an estimated increase of 33 and 34 loyalty points, respectively, while a one-unit increase in age is associated with a decrease of about 4 loyalty points. Hence, the visuals show that there is a clear positive correlation between spending score / remuneration and loyalty points, whereas age shows a very weak correlation. 

Consequently, a multiple linear regression was built using statsmodels function to explore these similar linear associations. The correlation coefficients for the variables are displayed below:


<img width="352" height="103" alt="image" src="https://github.com/user-attachments/assets/b6ef9783-d597-43d0-a1e5-9d5a16dd3c93" />


The correlation results therefore show that:


<img width="478" height="124" alt="image" src="https://github.com/user-attachments/assets/133c5520-565b-40ad-b35a-f1f902d564a7" />


<img width="378" height="296" alt="image" src="https://github.com/user-attachments/assets/cf883fc7-8363-4bc3-ab9a-5bcfb5750377" />


These results indicate that remuneration and spending score exhibit a significantly positive relationship with loyalty points as compared to age which shows a weaker correlation with it, much like of what the simple linear regression also outlined.


Furthermore, after an examination of the distribution of the original loyalty points using a histogram, Q-Q plot, and the Shapiro-Wilk test, a significant deviation from normality was observed. Although normality of residuals is one of the regression assumptions, it is generally less critical than others, and such deviations can be acceptable when the sample size is sufficiently large.



An OLS regression was also performed, where key assumptions such as linearity, homoscedasticity, and normality of residuals were evaluated. This resulted to both the original and log-transformed loyalty models showing violations of linearity and homoscedasticity. To mend these issues, a box-cox transformation was applied. 



Despite these improvements, the Breusch-Pagan test indicated heteroscedasticity in the residuals (as shown below), meaning that residual variance varied across different values of the independent variables, thereby possibly affecting the reliability and interpretation of the regression outcomes. 



<img width="451" height="150" alt="image" src="https://github.com/user-attachments/assets/a1f7adc6-8db3-423a-b688-b7d99b737d9c" />


Nevertheless, The Box-Cox transformed OLS model showed improved R-squared values and performance, but heteroscedasticity remains a concern, limiting its predictive reliability for the turtle game’s objectives. Outlier analysis was also excluded due to unclear stakeholder definitions.



### *Clustering with k-means*


A structured K-means clustering process was also applied, beginning with data exploration and visualization, followed by the Elbow and Silhouette methods to identify the optimal cluster count. The analysis suggests that five (5) clusters offer a balanced and interpretable segmentation, enabling targeted marketing strategies—such as discounts for low earner–high spender groups and personalized campaigns for high earner–low spender segments.


<img width="221" height="154" alt="image" src="https://github.com/user-attachments/assets/688af0e5-83ed-4bf9-b29e-00a7887404da" />

<img width="227" height="154" alt="image" src="https://github.com/user-attachments/assets/d8c0e7fa-f487-4500-922c-806058d990a8" />


Customer segmentation is crucial for the marketing team to design targeted strategies instead of broad, costly campaigns that may deliver limited results.


<img width="249" height="186" alt="image" src="https://github.com/user-attachments/assets/bb0163b1-f7dc-4144-bf38-d35ab02770b3" />


### *Sentiment Analysis for Customer Reviews*


Customer reviews were processed using NLTK, including text cleaning, tokenization, and sentiment analysis. Word clouds, frequency distributions, and sentiment histograms were generated, revealing overall positive sentiment with common words like great, fun, excellent, and five stars. The top 20 positive and negative reviews provided further insight into customer perceptions across products and platforms.


<img width="451" height="234" alt="image" src="https://github.com/user-attachments/assets/a5095086-1abd-43a9-8c69-095467afeb60" />



Sentiment analysis showed mean polarity scores of 0.21 (reviews) and 0.22 (summaries), indicating generally positive sentiment with moderate variability. Quartile values confirmed predominantly positive tone. Common negative themes included “unclear instructions” and “faulty components”, suggesting opportunities for Turtle Games to enhance product quality and personalize support for dissatisfied customers.


<img width="469" height="176" alt="image" src="https://github.com/user-attachments/assets/1b13ba56-157c-4f23-a3fc-a31c0953bb0e" />


### *Data Analysis in R*


Using R, an exploration of the distribution of numerical variables  was done with histograms and bar charts, then examined how loyalty point accumulation varied across demographic groups.


<img width="248" height="198" alt="image" src="https://github.com/user-attachments/assets/96a936ac-f4d5-4618-9eab-8b9442a4520d" />

<img width="241" height="192" alt="image" src="https://github.com/user-attachments/assets/1ef39f88-8b6c-4352-b8c0-bd7b57d72fba" />

<img width="228" height="182" alt="image" src="https://github.com/user-attachments/assets/56b181fe-164a-4c47-ae61-0d85b2cf4c8e" />

<img width="238" height="190" alt="image" src="https://github.com/user-attachments/assets/1b3be6f7-d246-4580-9445-6a1ecf088e92" />

<img width="227" height="181" alt="image" src="https://github.com/user-attachments/assets/892445a7-64c4-461d-8940-7fa7fac0c269" />

<img width="230" height="187" alt="image" src="https://github.com/user-attachments/assets/015fe055-c8ca-4056-a4e8-fc9bd557e85b" />


Both genders showed higher loyalty points with increasing income, though women generally accumulated more, likely due to greater representation in the data. 



<img width="375" height="265" alt="image" src="https://github.com/user-attachments/assets/4eb1e5f6-fd13-4c5e-9e7a-e16e1f898670" />


The trend, however, is reversed for spending scores. 


<img width="287" height="289" alt="image" src="https://github.com/user-attachments/assets/286d35d5-0ab6-4a1b-9793-3c589488d06f" />


Higher income increased loyalty points across education levels, though the effect lessened with higher education—suggesting a marketing opportunity for Turtle Games. Loyalty points were positively skewed (skew = 1.46, kurtosis = 4.71), indicating that transformations or non-linear models could improve regression accuracy.


<img width="290" height="299" alt="image" src="https://github.com/user-attachments/assets/bd2a0237-51b3-4c80-a167-c2c71aa8c1fa" />



## Conclusion

The analysis demonstrates that both spending score and remuneration possess significant explanatory power in predicting loyalty points accumulation. This model enables Turtle Games to generate more accurate forecasts of customer loyalty behavior and to identify distinct customer segments for targeted marketing initiatives, thereby enhancing overall engagement effectiveness.


## Recommendations

NLP sentiment analysis revealed generally positive feedback but highlighted several issues such as “unclear instructions” and “faulty components”. Thus, structured reviews (e.g., Likert scales) could improve feedback quality. Predictive models showed income and education influence loyalty, while cluster analysis identified five segments, therefore presenting an opportunity for Turtle Games to refine products, target marketing, and boost customer engagement.
















