# L11-AWS-Core-Services

## Approach
In this project, I built a serverless data pipeline using AWS core services to query e-commerce sales data. 
1. **Amazon S3:** Configured as the data lake to store the raw `Amazon Sale Report.csv` dataset and Athena query results.
2. **AWS IAM:** Created a role with `AmazonS3FullAccess` and `AWSGlueServiceRole` to securely grant AWS Glue permissions to read the S3 bucket.
3. **AWS Glue:** Created and ran a crawler to automatically infer the schema of the CSV file and create a table in the Glue Data Catalog (`ecommerce_db`).
4. **Amazon CloudWatch:** Used to monitor the Glue crawler logs and ensure successful execution.
5. **Amazon Athena:** Used serverless SQL to query the processed database to extract business insights.

## Query Explanations
* **Query 1:** Retrieved the first 10 records to verify the data loaded correctly.
* **Query 2:** Grouped the data by category to find the total number of orders per product category.
* **Query 3:** Analyzed revenue and unit sales by fulfilment method, filtering out cancelled and pending orders.
* **Query 4:** Extracted the sales month to calculate the chronological monthly sales trend.
* **Query 5:** Used window functions (`RANK()`) to find the top 5 highest-revenue SKUs within each product category.

## Screenshots

### 1. S3 Buckets Structure
*(Shows the raw-data and athena-results folders)*
![S3 Bucket](https://github.com/user-attachments/assets/f9c68199-fe4b-43b8-923c-ae2b50081ef6)

### 2. IAM Role Permissions
*(Shows the Glue crawler role with S3 and Glue access)*
![IAM Role](https://github.com/user-attachments/assets/140e3f24-9cc7-4332-a5fa-eed174e4ca6d)

### 3. CloudWatch Logs
*(Shows the successful execution of the Glue crawler)*
![CloudWatch Logs](https://github.com/user-attachments/assets/6617a589-5ff9-4cdd-bf49-a19b4fed3f34)
