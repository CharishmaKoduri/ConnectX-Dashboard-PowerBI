# 📡 ConnectX Telecom Analysis Dashboard

An interactive **Power BI dashboard** designed to analyze customer churn, revenue, demographics, payment methods, contracts, and tenure. This project transforms telecom customer data into actionable business insights, enabling organizations to improve customer retention and make data-driven decisions.

---

## 📖 Table of Contents

- [Project Overview](#project-overview)
- [Tools Used](#tools-used)
- [Data Preparation](#data-preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis(eda))
- [DAX Measures](#dax-measures)
- [Key Insights](#key-insights)
- [Dashboard Preview](#dashboard-preview)

---

### 📌 Project Overview

Customer churn is one of the biggest challenges in the telecom industry. This dashboard provides a comprehensive analysis of customer behavior, helping identify churn patterns, revenue distribution, customer demographics, and payment preferences. Interactive visualizations allow users to explore data dynamically and support strategic business decisions.

---

### 🛠 Tools Used

| Tool | Purpose |
|------|----------|
| Excel | Data Cleaning & Formatting |
| Power Query | Data Transformation |
| Power BI | Dashboard Development |
| DAX | KPI Calculations & Measures |

---

### 🧹 Data Preparation

The following preprocessing steps were performed:

- Imported dataset into Power BI
- Removed duplicate records
- Checked for missing values
- Corrected data types
- Cleaned categorical values
- Created calculated columns
- Built DAX measures
- Optimized data model

---

### 🔍 Exploratory Data Analysis (EDA)

The dashboard answers important business questions such as:

- What percentage of customers have churned?
- What is the gender distribution of customers?
- Which payment methods are most preferred?
- Which contract types have the highest customer count?
- How does customer tenure affect total charges?
- Which customer segment contributes the highest revenue?

---

### 📈 DAX Measures

```DAX
Total Customers = COUNT(Customer[Customer ID])

Total Revenue = SUM(Customer[Total Revenue])

Total Charges = SUM(Customer[Total Charges])

Churned Customers =
CALCULATE(
    COUNT(Customer[Customer ID]),
    Customer[Customer Status] = "Churned"
)

Churn Rate =
DIVIDE([Churned Customers], [Total Customers]) * 100
```

---

### 📊 Key Insights

- Approximately **67%** of customers are retained, while **26%** have churned.
- Customer distribution is nearly equal between male and female users.
- Cash is the most commonly used payment method.
- Monthly contracts account for the largest customer base.
- Customers with longer tenure generate significantly higher total charges.
- Revenue contribution is balanced across both genders.


---

### 📸 Dashboard Preview

The dashboard provides interactive insights into:

- Customer Churn Analysis
- Revenue Distribution
- Gender Analysis
- Contract Analysis
- Payment Method Trends
- Customer Status Overview
- Tenure vs Total Charges

<img width="1284" height="725" alt="Screenshot 2026-07-08 180825" src="https://github.com/user-attachments/assets/1c85d236-6e08-4c1d-9579-191cb7c36d3c" />


Users can interact with visuals using filters and drill-down functionality for deeper business analysis.

---

### 🎯 Project Outcome

This Power BI dashboard converts raw telecom customer data into meaningful business insights through interactive visualizations and KPI tracking. It helps businesses understand customer behavior, identify churn drivers, optimize retention strategies, and support data-driven decision-making.

---

### `⭐ If you found this project useful, consider giving it a star!`
