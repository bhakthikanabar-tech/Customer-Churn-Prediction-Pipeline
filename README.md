# 🛰️ Predictive Churn Analytics  
### ⚡ End-to-End Machine Learning Pipeline for Proactive Retention

---

## 🎯 Project Mission
Shift from **"What happened?" → "What will happen?"**

This project builds a **Predictive Retention System** that:
- Identifies **high-risk customers before churn**
- Uses **price sensitivity + tenure signals**
- Enables **data-driven intervention strategies**

> 💡 Designed to bridge **Software Engineering + Statistical Machine Learning**

---

## 🧠 System Thinking (Pipeline View)

```
Excel (ETL) ➡️ Tableau (EDA) ➡️ R (ML Engine) ➡️ Tableau (Decision UI)
```

✨ Each layer transforms data from **raw → insight → prediction → action**

---

## 📂 Repository Blueprint

```bash
├── 📁 data          
│   ├── clean_source.xlsx    # Post-ETL Normalized Data
│   └── Final_churn_analysis.csv        # ML Output with Risk Probabilities
│   └── Raw_Data.xlsx    #Raw data before cleaning
│
├── 📁 scripts       
│   └── churn_logic.R     # R Source Code (GLM & T-Test)
│
└── 📁 dashboards    
    ├── v1_eda.twb       # Initial Hypothesis Testing
    └── Predictive churn analysis.twb # Production-ready BI Tool
    └── Final_dashboard_preview.png  #Image of Final action
    └── Visualixation_preview  #Image of the cleaned data through visual tools
```

---

## ⚙️ Pipeline Breakdown

### 🧩 Phase 1 — Data Engineering (Excel ETL)

**Tool:** Excel Power Query  

🔧 What happens here:
- Type normalization (`MonthlyCharges → Numeric`)
- Missing value handling (Mean Imputation)
- Schema consistency checks
- Feature selection:
  - `tenure`
  - `Contract`
  - `MonthlyCharges`

> 🚫 Eliminates **GIGO (Garbage In, Garbage Out)**

---

### 📊 Phase 2 — Hypothesis Discovery (Tableau)

**Technique:** LOD Expressions

```sql
{ FIXED [Customer ID] :
    SUM(IF [Churn] = "Yes" THEN 1 ELSE 0 END)
}
```

💡 Insight Generated:
- Customers with **higher monthly charges show higher churn**

➡️ This becomes the **hypothesis for statistical validation**

---

### 🧪 Phase 3 — Statistical Engine (R)

#### 📈 A. Welch T-Test (Significance Check)

```r
t_test_result <- t.test(MonthlyCharges ~ Churn, data = telecom_data)
```

✔ Result:
- p-value < 2.2e-16  
- Strong statistical significance  
- Confirms price sensitivity impact  

---

#### 🤖 B. Logistic Regression (Prediction Model)

```r
churn_model <- glm(
  Churn ~ MonthlyCharges + tenure,
  data = train_data,
  family = "binomial"
)
```

```r
telecom_data$predict_prob <- predict(
  churn_model,
  type = "response"
)
```

🎯 Output:
- Probability score (0 → 1)
- Represents **likelihood of churn**

---

### 🚀 Phase 4 — Decision Layer (Tableau UI)

💡 Transforms predictions into **business actions**

**Key Features:**
- Individual customer risk mapping
- Scatter-based “Churn Danger Zone”
- Interactive filtering

---

## 🎯 Risk Intelligence System

| Risk Level | Probability | Meaning |
|-----------|------------|--------|
| 🔴 High Risk | > 0.7 | Immediate retention action needed |
| 🟡 Medium Risk | 0.4 – 0.7 | Monitor & engage |
| 🟢 Low Risk | < 0.4 | Stable customers |

---

## 🌐 Interactive Dashboard

**(https://public.tableau.com/app/profile/bhakthi.kanabar/viz/Predectivechurnanalysispricesensitivityandrisk/Dashboard1?publish=yes)**  

---

## 🧬 Technical DNA

### 💻 Languages
- R (Tidyverse, GLM, Stats)

### ⚙️ Engineering
- Excel Power Query
- Data Cleaning & Transformation
- Schema Design

### 📐 Mathematics & ML
- Hypothesis Testing (Welch T-Test)
- Logistic Regression
- Binary Classification
- Probability Modeling

### 📊 BI / UX
- Tableau
- LOD Expressions
- Parameterized Dashboards
- Risk Visualization

---

## 🧩 What Makes This Project Stand Out?

✨ Not just analysis — a **complete ML system**
- End-to-end pipeline (ETL → ML → Deployment)
- Combines **statistics + engineering + BI**
- Real-world **business impact use-case**
- Interactive & decision-driven output

---

## 🔮 Future Enhancements

- 🔹 Add more features (Customer Support Calls, Usage Patterns)
- 🔹 Try advanced models (Random Forest, XGBoost)
- 🔹 Deploy as a web app (Streamlit / Flask)
- 🔹 Automate ETL pipeline

---

## 👨‍💻 Author

**Bhakthi Kanabar**  
🎓 Computer Science Engineering @ BCET  

---

## ⭐ Support

If you found this project useful:
- ⭐ Star this repository
- 🔗 Connect with me (www.linkedin.com/in/bhakthi-kanabar-3b597428a)
- 🚀 Share feedback

---
