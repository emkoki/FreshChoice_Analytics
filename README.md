                             FRESHCHOICE ANALYTICS
            
            Problem Framing and  Data Acquisition

This section involves formulating business questions that would help management understand the sales perfomance,profitability,customer purchasing power and many more.I plan to accomplish the task in two ways ;defining some business questions and defining KPIs.

1. Define your business questions

  -Which products and categories generate the most revenue and profit?	
  -Which stores meet their monthly sales targets?	
  -How do sales vary across months and days of the week?
  -Which customer segments contribute the most revenue?	
  -Is average daily sales different on weekends and weekdays?
 2.Defining KPIs
  -Net sales	
  -Gross sales	
  -Total profit	
  -Total cost	
  -Profit margin	
  -Order count

        Data Cleaning and preparation


  In my vs code i created a new notebook for cleaning the data set. After loading the dataset i viewed it and started cleaning as follows;

1.Inspecting the data set
2.checking for duplicate records then deleting the duplicates
3.Checking and correcting the data types. The issue was mainly at the transaction date column and i fixed it by changing the  type into the proper datetime field
4.Investigating missing values
5.Check for invalid values and delete them if any
6.I also added some additional features ;i calculated the Gross_sales , the Net_sales  and the profit
7.Investigated the outliers using te interquartile range method
8.Lastly i saved the cleaned dataset

             Exploratory Data Analysis


Using the cleaned dataset as started of my exploratory data analysis as follows;
1.Calculating the main KPIs e.g net sales , gross sales, total profit, total costs, total orders and units sold.
2.Analyzed the monthly sales the visualized the results using a bar graph.
    -The monthly sales was the highest on December
    -The monthly sales was the lowest in February
3.Analyzed the daily sales trend the visualized it.
    -The daily sales fluctuate daily
4.Analyzed the relationship between the product categories and net sales then visualized it sing a bar graph.
    -Snacks are the one with the highest sales and profits.
    -Meat and sea food are the ones with the lowest sales and profits.
5.Analyzed the performance between different stores.
6.Analyzed the weekday versus the weekend sales.
7.the lastly analyzed the customer segments.

            SQL Analytics

I created a database in postgres sql ,then i imported the csv files from the already cleaned dsta set into their respective corresponding tables in dbeaver. During the importation i checked and rectified the data types  from there on i started querying these are some of the steps and analysis that i did;
 
1.Confirmed that all the tables have been imported.
2.Viewed all the tables.
3.Queryed the total sales and profits 
4.Found the highest performing product categories
   -snacks is the highest performing product
   -meat and sea food is the least performing product
5.Ranked stores by revenue.
6.Compared the actual sales with targets.
7.Performed the recency ,frequency and monetary value analysis.

                Statistical Analysis


-In this milestone the goal is to use statistical tests to evaluate whether observed differences are supported by evidence.I  defined a hypothesis which is ;Do average daily sales differ between weekdays and weekends?And the hypothesis cold be of two results ;
      1.Null hypothesis-Mean daily sales are equal on weekdays and weekends.
       2.Alternative hypothesis, - Mean daily sales differ between weekdays and weekends. 
-To test investigate this i run a Welch's t-test.
-After getting the results i calculated a 95% confidence level.
-Then lastly i interpreted the results.
| Result                                  | Interpretation                                         |
| --------------------------------------- | ------------------------------------------------------ |
| P-value below 0.05                      | Evidence against equal mean daily sales                |
| P-value at least 0.05                   | Insufficient evidence to reject equal mean daily sales |
| Confidence interval entirely above zero | Estimated weekend mean is higher                       |
| Confidence interval entirely below zero | Estimated weekend mean is lower                        |
| Confidence interval includes zero       | The interval does not rule out no difference           |


               Predictive Model



For this project  i started with daily sales forecasting since It connects directly to the business objective of understanding and planning demand. this is what i did to till completion of the task;
1.Define prediction problem.
  -estimate daily net sales using historical sales and calendar information
2.Created the modelling dataset -i used the daily sales data that i had created earlier in a previous milestone.
3.Engineered the forecasting features.
4.Split the data chronologically.
5.Created a baseline forecast.
6.Trained a random forest model.
7.Evaluated the model performance sing metrics such as; MAE, MAPE and RSME.
8.Tested and interpreted the model results

| Metric          | Meaning                                                                                        |
| ------           | -----------------------------------------------------------      |
| MAE             | Average absolute prediction error, in sales currency units       |
| RMSE           | Penalizes large prediction errors more heavily                          |
| MAPE           | Average absolute percentage error for nonzero actual values |


                   Dashboarding


This milestone involves using the dataset to create visual and interactive illustrations to help the management understand the company's performance . To try and accomplish this task i did as follows;
1.I imported the dataset into power bi and made sure all the tables were there.
2.Opened model view and created relationship which would help the dashboard be interactive.
3.Created DAX measures e.g
       -Net sales
       -Total profits 
       -Gross sales 
       -Total profit
       -Profit margin percentage
       -Sales target 
       -Units sold
4.Built dashboard pages some of them are;
        -Executive overview
        -Product performance
        -Store performance
        -Customer insights
.
                  Documentation and Presentation

For this section I've written an inclusive readme and arranged my files in a systemic manner ,from the data which include the raw data and the processed data ,to the notebooks ,to the sql queries some outputs and then the power bi dasboards. AFter the file arrangement i then pushed the project into git hub  .