# AI Analysis Evaluation

## Purpose

This document demonstrates how an analyst can evaluate an AI-generated analysis rather than accepting technically valid output without examining its meaning, assumptions, and limitations.

## Evaluation Dimensions

### 1. Does the analysis answer the actual question?

An analysis should remain connected to the original business question.

A technically correct calculation can still be irrelevant if it does not help answer the question under investigation.

### 2. Is the dataset grain understood?

The Sample Superstore dataset is recorded at the order-line level.

Repeated Order IDs are therefore expected. Treating every row as a separate order would overstate the number of orders and could lead to incorrect conclusions.

The dataset contains 9,994 order-line records but only 5,009 are unique orders.

### 3. Are aggregations valid?

Aggregations should match the business question and the grain of the data.

Analogy, overall profit margin should be calculated as:

Profit Margin = Total Profit / Total Sales

It should not be calculated by simply averaging individual row-level profit margins.

### 4. Are joins and relationships valid?

Joins can unintentionally multiply records when the relationship between tables is incorrectly understood.

So it quintessential that an analyst should verify:

- Join keys
- Key uniqueness
- Relationship cardinality
- Row counts before and after the join
- Whether important totals changed unexpectedly

### 5. Are metrics correctly defined?

Different metrics answer different questions.

For example:

- Sales measures revenue recorded in the dataset.
- Profit measures recorded profit.
- Profit margin measures profit relative to sales.

A product with high sales is not automatically a highly profitable product because discount amounts on such product and other factors may impact its profit.

### 6. Does the conclusion follow from the evidence?

A conclusion should not be stronger than the evidence supporting it.

For example, the dataset shows that higher discount levels are generally associated with lower recorded profit margins.

This is a descriptive relationship.

It does not by itself establish that discounts caused the losses because discount levels may also be associated with product mix, category, region, customer characteristics, or other factors.

### 7. Could the result mislead a decision-maker?

Analytical results should be examined for situations where a technically correct number could produce a misleading interpretation.

Examples include:

- Very small sample sizes
- Extreme percentage margins caused by small denominators
- Aggregating data at the wrong level
- Confusing sales with profit
- Treating association as causation
- Ignoring product or regional differences

## Example AI Failure

An AI system might conclude that the product with the highest sales is the company's best-performing product.

### Evaluation

This conclusion is incomplete because sales measure revenue rather than profitability.

A product can generate substantial sales while producing relatively little profit or even worst still, a loss.

A more appropriate analysis would examine sales, total profit, and profit margin together.

## Example: Discount and Profitability

An AI-generated analysis might state that:

> "Higher discounts cause lower profits."

### Evaluation

The dataset supports an association between higher discount levels and lower recorded profit margins. However, the available data does not establish that discounting independently caused the observed losses.

Further analysis would be required as a control measure for, or to analyze other factors such as:

- Product
- Sub-category
- Category
- Region
- Customer segment
- Order characteristics

Therefore, the more defensible conclusion is that discount level and recorded profitability are associated in this dataset, while the causal relationship remains unestablished.

## Cross-Validation With SQL

Selected Python/pandas calculations were independently reproduced using SQLite SQL to provide a two-way or multiple validation of analysis and conclusions for a more solid work.

The following analyses were cross-validated:

1. Overall sales and profitability
2. Category profitability
3. Regional profitability
4. Discount-level profitability
5. Loss-making products

Agreement between the Python and SQL results provides an additional validation check for the calculations.

Cross-validation does not prove that the underlying business interpretation is correct, but it helps identify implementation or calculation errors.

## Reference Standard

A robust analytical workflow should:

1. Understand the data structure and grain.
2. Validate assumptions.
3. Define metrics explicitly.
4. Check aggregation and join logic.
5. Cross-check important calculations where practical.
6. Distinguish association from causation.
7. Identify limitations and sources of uncertainty.
8. Communicate conclusions at a level supported by the evidence.

## Conclusion

The purpose of analytical evaluation is not simply to determine whether code executes successfully.

A strong analyst must also determine whether:

- The question was correctly understood.
- The data was correctly interpreted.
- The metric was correctly defined.
- The calculation was correctly implemented.
- The conclusion is supported by the evidence.
- Important limitations have been communicated.

This approach is particularly important when evaluating AI-generated analytical outputs because an AI system can produce syntactically correct code and plausible-looking results while still making incorrect assumptions or drawing conclusions that are stronger than the available evidence.