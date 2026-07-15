# ⚽ International Soccer Team Performance Analytics Data Warehouse

A modern data warehousing and business intelligence project that transforms over a century of international soccer match data into an analytical platform for evaluating team performance, tournament outcomes, and competitive trends.

This project combines **Python, SQL, dimensional modeling, and Power BI** to build an end-to-end analytics solution that supports data-driven decision making for coaches, analysts, and sports organizations.

---

## 📖 Project Overview

International soccer generates thousands of matches across tournaments every year, making it difficult to consistently evaluate team performance across competitions, locations, and time.

This project develops a centralized data warehouse using Kimball dimensional modeling to organize historical international match data into an efficient analytical structure. The warehouse powers interactive Power BI dashboards that reveal long-term performance trends, home-field advantages, tournament success, and scoring dynamics.

---

## 🎯 Project Objectives

- Design a scalable soccer analytics data warehouse
- Build both transactional and dimensional database models
- Create an optimized star schema for analytical querying
- Develop SQL queries for business intelligence reporting
- Build interactive dashboards in Power BI
- Generate actionable insights from historical international soccer data

---

## 📊 Dataset

**Source**

- International Football Results Dataset (Kaggle)

**Coverage**

- Original data: 1872–2026
- Analysis period: **2011–2025**

**Data Includes**

- Match results
- Teams
- Tournaments
- Match locations
- Scores
- Goal differences
- Home/Away teams
- Historical team name mappings

---

## 🛠 Data Preparation

Data preprocessing was completed in Python before loading into the warehouse.

### Data Cleaning

- Standardized team names
- Standardized country and location names
- Converted date fields
- Corrected data types
- Removed duplicate records
- Removed missing values
- Filtered data to the most recent 15 years (2011–2025)

### Validation

- Shape verification
- Data type validation
- Record counts
- Duplicate checks
- Summary statistics

---

## 🏗 Data Warehouse Design

This project demonstrates the complete data warehouse development lifecycle.

### Transactional Model

Designed to efficiently capture operational soccer match data including:

- Matches
- Teams
- Tournaments
- Locations
- Goal events
- Penalty shootouts

---

### Dimensional Model

A Kimball-style Star Schema was developed for analytical reporting.

### Fact Table

**FACT_MATCH_RESULT**

Measures include:

- Home Score
- Away Score
- Total Goals
- Goal Difference
- Home Win
- Away Win
- Draw
- Neutral Venue

### Dimension Tables

- DIM_TEAM
- DIM_DATE
- DIM_TOURNAMENT
- DIM_LOCATION

This design enables fast aggregations and efficient business intelligence reporting.

---

## 💻 SQL Analytics

Custom SQL queries were written to answer key business questions, including:

- Team win rates over time
- Wins by tournament
- Home vs away performance
- Goal difference analysis
- Match outcome distributions

The warehouse structure supports flexible reporting across multiple business dimensions.

---

## 📈 Exploratory Data Analysis

Initial exploration was performed in Python to better understand the dataset.

Key analyses included:

- Match volume by year
- Match outcome frequencies
- Goal statistics
- Team participation
- Tournament participation
- Home win rates
- Geographic distribution

---

## 📊 Interactive Dashboard

Power BI dashboards were created to support exploratory analysis and executive reporting.

### Dashboard Features

- Team Win Rate Trends
- Wins by Tournament
- Home vs Away Performance
- Goal Difference Distribution
- KPI Cards
- Interactive Team Filters
- Tournament Filters

Users can dynamically compare teams across different competitions and seasons.

---

## 🔍 Key Findings

### 📈 Consistent High Performers

Historically strong teams such as Argentina maintained consistently high win rates over the 15-year period.

---

### 🏆 Tournament Performance Matters

Performance varied significantly across tournaments, indicating that competitive context influences team success.

---

### 🏠 Home Field Advantage

Most teams achieved considerably more victories at home than away, reinforcing the impact of home-field advantage.

---

### ⚽ Close Matches Dominate

Most matches were decided by relatively small goal differences, suggesting that small tactical improvements could significantly influence outcomes.

---

## 🛠 Technologies Used

### Programming

- Python
- SQL

### Database

- Oracle SQL Developer

### Business Intelligence

- Power BI

### Data Modeling

- Kimball Dimensional Modeling
- Star Schema Design
- Transactional Database Design

---

## 💡 Skills Demonstrated

- Data Warehousing
- Dimensional Modeling
- Star Schema Design
- Database Design
- SQL Development
- ETL
- Data Cleaning
- Data Transformation
- Python
- Oracle SQL
- Power BI
- Dashboard Development
- Business Intelligence
- Exploratory Data Analysis
- Data Storytelling
- Sports Analytics

---

## 📂 Project Workflow

```
Raw Kaggle Data
        │
        ▼
Python Data Cleaning
        │
        ▼
Data Validation
        │
        ▼
Oracle SQL Data Warehouse
        │
        ▼
Star Schema Design
        │
        ▼
SQL Analytics
        │
        ▼
Power BI Dashboards
        │
        ▼
Business Insights
```

---

## 📈 Business Value

This project demonstrates how modern data warehouse architecture can transform large volumes of historical sports data into actionable business intelligence.

Potential users include:

- Soccer coaches
- Performance analysts
- Sports organizations
- Scouts
- Media analysts
- Tournament organizers

The dimensional model enables fast analytical queries while supporting scalable reporting and interactive dashboarding.

---

## 🚀 Future Improvements

Potential enhancements include:

- Predictive models for match outcome forecasting
- Player-level performance analytics
- Weather and environmental data integration
- Injury data analysis
- Advanced machine learning models
- Live match data pipelines
- Cloud-based data warehouse deployment

---

## 📷 Sample Dashboard

*(Add screenshots of your Power BI dashboards here.)*

Suggested screenshots:

- Team Performance Dashboard
- Team Win Rates Over Time
- Wins by Tournament
- Home vs Away Wins
- Goal Difference Distribution
- Star Schema Diagram

---

## 👥 Authors

**Safiya Joseph**  
Master of Science – Artificial Intelligence & Business Analytics

**Gavrie Grant**

---

## 📚 Data Source

International Football Results Dataset

https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017/data

---

## ⭐ Repository Highlights

✔ Python Data Cleaning

✔ SQL Data Warehouse Development

✔ Oracle SQL

✔ Kimball Star Schema

✔ Power BI Dashboarding

✔ Business Intelligence Reporting

✔ Sports Analytics

✔ Data Storytelling
