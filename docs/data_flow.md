# Data Flow

## End-to-End Processing Flow

### Step 1: File Upload

A campaign dataset is uploaded to the raw data bucket.

Example:

```text
s3://ads-raw/advertising_campaign_2026_06_01.csv
```

---

### Step 2: Event Detection

Amazon EventBridge receives a file upload event from Amazon S3.

---

### Step 3: Workflow Execution

EventBridge triggers an AWS Step Functions workflow.

---

### Step 4: Data Validation

The validation service verifies:

* Required columns exist
* Data types are valid
* ROI categories are supported
* Dataset is not empty

If validation fails:

```text
Validation Failure
        │
        ▼
      Amazon SQS
```

---

### Step 5: Data Transformation

AWS Glue performs:

* Data cleansing
* Duplicate removal
* Data standardization
* Data enrichment

Output:

```text
s3://ads-processed/
```

---

### Step 6: Analytics Generation

AWS Glue generates aggregated metrics and analytics datasets.

Output:

```text
s3://ads-analytics/
```

---

### Step 7: Metadata Registration

AWS Glue Catalog updates dataset metadata.

---

### Step 8: Summary Metrics Storage

Aggregated business metrics are stored in DynamoDB.

Example:

* Top Device Type
* Top Performing Location
* ROI Distribution
* Engagement Summary
