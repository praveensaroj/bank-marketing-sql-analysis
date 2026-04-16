## Bank Marketing Analysis using SQL

### Objective
The goal of this project is to analyze customer data and identify factors that influence subscription to a term deposit.

This project focuses on extracting actionable insights to improve marketing campaign effectiveness and customer targeting.



### Tools Used
- PostgreSQL  
- SQL (Aggregation, CASE, GROUP BY)  
- Data Analysis  



### Dataset

- The dataset contains customer details, campaign information, and economic indicators such as interest rates.
- The dataset used in this project is included in the repository



### Key Insights

- Students and retired customers have significantly higher conversion rates but represent a small portion of the dataset  
- Blue-collar customers have low conversion despite being a large segment  
- Conversion decreases when customers are contacted too frequently, indicating diminishing returns  
- Longer call duration significantly increases conversion rates  
- Customers with previous successful campaigns are most likely to convert  
- Lower interest rates are associated with higher conversion rates  
- Students with longer calls show very high conversion (~50%) but should be targeted selectively  



### Recommendations

- Focus on high-conversion segments like students and previous successful customers  
- Avoid excessive follow-ups to reduce customer fatigue  
- Prioritize longer and meaningful interactions  
- Adjust strategy based on economic conditions  
- Improve targeting for low-performing segments  


### Project Structure

- bank_marketing_analysis.sql → SQL queries  
- insights.md → Business insights  
- bank_data.csv → Raw dataset  
- README.md → Project overview  


### Conclusion

The analysis shows that customer behavior, campaign strategy, and economic conditions all play a significant role in conversion. By focusing on high-performing segments and optimizing interaction strategies, businesses can improve overall campaign performance.
