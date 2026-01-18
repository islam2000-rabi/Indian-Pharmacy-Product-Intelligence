# Indian Pharmacy Product Intelligence – SQL & Power BI Project

## Project Summary

In this project, I analyzed Indian medicine master data using PostgreSQL and SQL to understand market trends in the pharmaceutical sector.  
The goal was to identify manufacturer dominance, discontinued medicine risks, pricing patterns, and therapeutic substitution opportunities.  
Finally, I built an interactive Power BI dashboard to visualize key insights for pharmacy inventory and procurement decisions.

---

## Project Objective

- Analyze Indian medicine data to understand manufacturer market share  
- Identify discontinued medicines and high-risk manufacturers  
- Detect substitute medicines based on drug composition  
- Study pricing variation across manufacturers and dosage forms  
- Build a Power BI dashboard for business decision-making

---

## Project Architecture

Data Flow:

Python → PostgreSQL → SQL Views & Modeling → Power BI Dashboard → Word Project Report → Presentation Slides  

![Project Architecture](https://github.com/islam2000-rabi/Indian-Pharmacy-Product-Intelligence/blob/main/Project%20Architecture.png)

---

## Dataset Information

- Source: Indian Medicine Dataset  
- Total records: ~246,000 medicines  
- Main columns used:
  - id (medicine id)
  - name (medicine name)
  - price (medicine price)
  - is_discontinued 
  - manufacturer_name
  - type(allopathic)
  - pack_size_label
  - short_composition1
  - short_composition2
  - medicine_type (tablet or capsules etc)

---

## Tools & Technologies Used

- Python – initial data cleaning  
- PostgreSQL – database storage and SQL analysis  
- SQL – data modeling and analytical queries  
- Power BI – interactive dashboard  
- MS Word – project report documentation

--- 

## Key SQL Analysis Performed

- Top manufacturers by product count  
- Average price per manufacturer (premium vs budget segmentation)  
- Percentage of discontinued medicines  
- Manufacturers with highest discontinuation rate  
- Substitute medicine groups based on compositions  
- Pack size vs price variation  
- Price comparison across medicine types  

All SQL scripts are included in the `Query Script.sql` file.

---

## Power BI Dashboard

The Power BI dashboard includes:

- KPI Cards:
  - Total Discontinued Medicines  
  - Average Medicine Price  
  - Discontinuation Rate  

- Charts:
  - Dosage-form-wise discontinued medicines  
  - Manufacturer-wise discontinued vs available medicines  
  - Most discontinued compositions  
  - Manufacturer discontinuation summary table  

- Filters:
  - Manufacturer  
  - Dosage Form
 
 ---

## Market Insights

- A small number of manufacturers control most medicine listings  
- Around 3% of medicines are discontinued  
- Tablets dominate the medicine market  
- Many compositions have multiple substitute brands  
- Some manufacturers show higher discontinuation risk  
- Significant pricing differences exist among manufacturers
