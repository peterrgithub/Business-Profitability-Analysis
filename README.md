# Business Profitability Analysis

## Project Overview

This project analyzes retail sales data to investigate profitability across products, categories, regions, and discount levels in a business.

The project was designed as an independent data-analysis exercise with specific emphasis on analytical correctness, metric definitions, aggregation, validation, and potential failure modes in an AI-generated analysis.

## Business Question

Management wants to understand why profitability varies across the business despite strong sales performance.

The analysis investigates:

- Overall sales and profitability
- Profit margin
- Regional performance
- Category performance
- Discount and profitability relationships
- Loss-making products
- Potential analytical errors and misleading interpretations

## Analytical Skills Demonstrated

- Python
- pandas
- SQL
- SQLite
- Data cleaning and validation
- Exploratory data analysis
- Aggregation
- Metric definition
- Cross-validation of analytical results
- Data-quality checks
- Business interpretation
- Analytical reasoning
- AI-generated analysis evaluation

## Key Analytical Findings

- The dataset contains 9,994 order-line records representing 5,009 unique orders.
- Total sales were approximately USD 2.30 million, with a total profit of approximately USD 286,397, and an overall profit margin of
- 12.47%.
- Profitability varies substantially across product categories and regions of the business' coverage.
- Furniture has a substantially lower aggregate recorded profit margin than Office Supplies and Technology.
- 301 of 1,862 unique products are loss-making, generating approximately USD 548,418 in sales, also, a combined loss of approximately
- USD 77,068.
- Losses in this business are concentrated among a relatively small number of products.
- Higher discount levels generally correspond with lower recorded profit margins in the dataset.

These findings are descriptive and should not be interpreted as proof of causal relationships between aspects of the business.

## SQL Validation

Selected profitability calculations were independently reproduced using SQLite SQL and compared with the Python/pandas results to achieve validation of analysis using a second method.

The validation covered:

1. Overall sales and profitability
2. Profitability by category
3. Profitability by region
4. Profitability by discount level
5. Loss-making products

The Python/pandas and SQL results matched for these analyses.

## Important Analytical Considerations

This project emphasizes several data analytic principles that are vital when evaluating analytical or AI-generated results:

- Dataset grain
- Unique orders versus order-line records
- Duplicate-record interpretation
- Correct aggregation
- Metric definitions
- Join validation
- Association versus causation
- Small-denominator effects
- Potentially misleading conclusions

The source dataset is an order-line-level dataset. Therefore, repeated Order IDs are expected and should not automatically be treated as duplicate records.

## Project Structure

```text
Business-Profitability-Analysis
├── data
│   └── Sample - Superstore.csv
├── docs
│   └── AI_EVALUATION.md
├── notebooks
│   └── business_profitability_analysis.ipynb
├── sql
│   └── business_profitability_analysis.sql
└── README.md
