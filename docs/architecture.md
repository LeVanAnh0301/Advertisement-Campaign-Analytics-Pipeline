# System Architecture

## Architecture Overview

The platform follows an event-driven architecture that automatically processes advertising campaign datasets as they arrive.

```text
Campaign Data Source
          │
          ▼
      Amazon S3
          │
          ▼
   Amazon EventBridge
          │
          ▼
 AWS Step Functions
          │
          ▼
 Validation Lambda
          │
          ▼
 AWS Glue ETL Job
          │
          ▼
 Processed Analytics Dataset
          │
          ▼
 AWS Glue Data Catalog
          │
          ▼
 Amazon DynamoDB
```

---

## Components

### Amazon S3

Stores raw, processed, and analytics datasets.

#### Buckets

* ads-raw
* ads-processed
* ads-analytics

---

### Amazon EventBridge

Detects file upload events and initiates workflow execution.

---

### AWS Step Functions

Orchestrates the end-to-end processing workflow.

Workflow:

1. Validate dataset
2. Transform data
3. Generate analytics
4. Store summary metrics

---

### Validation Lambda

Performs data quality checks before processing.

Validation includes:

* Required column verification
* Data type validation
* Empty file detection
* Business rule validation

---

### AWS Glue

Processes and transforms campaign datasets using PySpark.

Responsibilities:

* Data cleansing
* Standardization
* Aggregation
* Analytics dataset generation

---

### AWS Glue Data Catalog

Maintains metadata and schema information for processed datasets.

---

### Amazon DynamoDB

Stores summarized campaign metrics for low-latency access.
