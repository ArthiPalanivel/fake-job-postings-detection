# 🚨 Fake Job Postings Detection Dashboard

## 📊 Overview
An interactive Power BI dashboard that analyzes and detects 
fraudulent job postings using the Kaggle Real or Fake Job 
Postings dataset, cleaned and stored in Snowflake.

## 🛠️ Tools Used
- **Dataset:** Kaggle — Real or Fake Job Postings
- **Data Warehouse:** Snowflake
- **Visualization:** Power BI Desktop (May 2025)
- **Theme:** Dark Navy + Red Alert

## 📁 Project Structure
```
├── fake_job_postings_detection.pbix
├── sql/
│   └── snowflake_queries.sql
├── screenshots/
│   ├── page1_overview.png
│   ├── page2_geographic.png
│   ├── page3_job_characteristics.png
│   └── page4_detail_table.png
└── README.md
```

## 📋 Dashboard Pages

### Page 1 — Executive Summary
- Total Postings, Fraudulent, Legitimate, Fraud Rate KPI cards
- Real vs Fake donut chart
- Fraud by Employment Type
- Fraud by Experience Level

### Page 2 — Geographic & Company Analysis
- Top 10 Cities by Fraud Count
- Fraud by Country Map
- City Fraud Scatter Chart
- Company Signal KPI cards

### Page 3 — Job Characteristics Analysis
- Fraud Rate by Industry
- Heatmap — Experience × Employment Type
- Key Fraud Signals Progress Bars

### Page 4 — Drillthrough Detail Table
- Filterable job posting table
- Conditional red/green row formatting
- Fake vs Real count cards

## 🔍 Key Insights
- Overall fraud rate is 5.08%
- Jobs with no company logo have 15.93 fraud rate
- Most fraudulent city is where the Location is not specified with 156 fake postings
- Most targeted industry is Oil & Energy

## 🗄️ Snowflake Setup
- Raw data loaded from Kaggle CSV
- Data cleaned using SQL views
- Null values handled using COALESCE
- Country/State codes converted to full names

## 📸 Screenshots
### Page 1 — Executive Summary
<img width="1372" height="767" alt="page1_overview" src="https://github.com/user-attachments/assets/ef1fc58b-6f2a-42b0-91e1-ac13c7aedfed" />


### Page 2 — Geographic & Company Analysis
<img width="1372" height="762" alt="page2_geographic" src="https://github.com/user-attachments/assets/c1ee9b88-e6d2-4ec8-9f4d-c1554ae3ae0c" />


### Page 3 — Job Characteristics Analysis
<img width="1375" height="761" alt="page3_characteristics" src="https://github.com/user-attachments/assets/c1eb3c54-171e-44ca-8616-d6656d2125b8" />


### Page 4 — Detail Table
<img width="1373" height="767" alt="page4_detail_table" src="https://github.com/user-attachments/assets/86dfaa0a-35ed-441e-9acf-d60d815d4009" />



## 📂 Dataset
- Source: [Kaggle — Real or Fake Job Postings]
(https://www.kaggle.com/datasets/shivamb/real-or-fake-fake-jobposting-prediction)
- Records: 17,880
- Features: 18 columns
- Target: `fraudulent` (0 = Real, 1 = Fake)

## 👤 Author
- **Name:** Arthi P
- **LinkedIn:**  (https://www.linkedin.com/in/arthi-palanivel-0b7437264)
- **GitHub:** (https://github.com/ArthiPalanivel)
