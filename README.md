# 🚀 Telecom Network & Customer Experience Analytics

## 📌 Overview

This is an **end-to-end Data Analytics project** where telecom data is analyzed to identify customer complaints, payment behavior, and network performance issues.

The project uses **Excel, SQL, Python, and Tableau** to generate business insights and build an interactive dashboard.

---

## 🎯 Business Problem

A telecom company is facing:

* Increasing customer complaints
* Payment delays and failures
* Unclear impact of network quality on users

The goal is to identify problem areas and support **data-driven decision-making**.

---

## 🗂️ Dataset

The project uses four datasets:

* **Customers** → customer details and subscription info
* **Network Usage** → daily usage data
* **Network Issues** → complaints and resolution time
* **Billing** → payment and billing behavior

---

## ⚙️ Process

### 📊 Excel

* Cleaned and standardized data
* Fixed city names and date formats
* Created Month & Year columns
* Built pivot tables for city-wise analysis

### 🗄️ SQL

* Created relational tables with keys
* Performed joins across datasets
* Calculated complaint rate per customer
* Analyzed monthly trends

### 🐍 Python (Pandas)

* Merged datasets into a final dataset
* Created new features:

  * Customer risk score
  * High usage flag
* Performed exploratory data analysis

### 📤 Data Export

Final datasets used for dashboard:

* `final_customer_data.csv`
* `usage_data.csv`

---

## 📊 Tableau Dashboard

The dashboard includes:

* KPI Cards (Total Customers, Complaints, High-Risk Customers)
* City-wise complaint analysis
* Complaints by payment status
* 4G vs 5G comparison
* Interactive city filter

---

## ❓ Business Questions & Answers

**Which cities need urgent improvement?**
→ Chennai and Delhi have the highest complaints

**Does network quality affect payments?**
→ Yes, poor network is linked with delayed and failed payments

**Are 5G users facing fewer issues?**
→ Yes, 5G users have slightly fewer complaints than 4G

---

## 💡 Key Insights

* Major complaints come from high-usage cities
* Most issues are from active (paid) users
* 5G performs better than 4G
* Payment failures are low but linked to network issues

---

## 🛠️ Tools Used

* Excel
* SQL
* Python (Pandas, NumPy, Matplotlib, Seaborn)
* Tableau

---

## 📈 Outcome

This project demonstrates a complete data analytics workflow:
data cleaning → transformation → analysis → visualization

It provides actionable insights to improve network performance and customer experience.


