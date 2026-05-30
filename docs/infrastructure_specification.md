# Infrastructure Specification

## Overview

This document defines the cloud infrastructure required to support the Advertisement Campaign Analytics Pipeline.

The infrastructure is provisioned using Terraform and follows an event-driven architecture on AWS.

---

# Environment

## AWS Region

```text
ap-southeast-1
```

---

## Environment Name

```text
dev
```

---

# Amazon S3

## Purpose

Store raw, processed, and analytics datasets.

---

## Buckets

### Raw Data Bucket

```text
ads-analytics-dev-raw
```

Purpose:

Store incoming campaign datasets.

Example:

```text
advertising_campaign_2026_06_01.csv
```

---

### Processed Data Bucket

```text
ads-analytics-dev-processed
```

Purpose:

Store cleansed and standardized datasets.

---

### Analytics Data Bucket

```text
ads-analytics-dev-analytics
```

Purpose:

Store aggregated reporting datasets.

---

# Amazon EventBridge

## Rule

```text
ads-file-upload-rule
```

Trigger:

```text
Object Created
```

Source:

```text
ads-analytics-dev-raw
```

Target:

```text
ads-processing-state-machine
```

---

# AWS Step Functions

## State Machine

```text
ads-processing-state-machine
```

Workflow:

```text
Validate File
      ↓
Transform Data
      ↓
Generate Analytics
      ↓
Store Summary
```

---

# AWS Lambda

## Function Name

```text
ads-validation-lambda
```

Purpose:

Validate incoming datasets.

Responsibilities:

* Required columns validation
* Data type validation
* Empty file validation
* Business rule validation

Runtime:

```text
Python 3.12
```

Timeout:

```text
60 seconds
```

Memory:

```text
512 MB
```

---

# Amazon SQS

## Queue Name

```text
ads-validation-dlq
```

Purpose:

Store failed validation events.

Retention:

```text
14 days
```

---

# AWS Glue

## Job Name

```text
ads-etl-job
```

Purpose:

Transform campaign data.

Technology:

```text
PySpark
```

Responsibilities:

* Data cleansing
* Duplicate removal
* Standardization
* Aggregation

Output Format:

```text
Parquet
```

---

# AWS Glue Data Catalog

## Database

```text
ads_analytics
```

---

## Tables

### campaign_processed

Stores cleansed campaign records.

---

### campaign_analytics

Stores aggregated analytics datasets.

---

# Amazon DynamoDB

## Table Name

```text
campaign_summary
```

Purpose:

Store aggregated metrics for dashboard consumption.

---

## Partition Key

```text
report_date
```

---

## Sort Key

```text
metric_name
```

---

# CloudWatch

## Log Groups

### Lambda Logs

```text
/aws/lambda/ads-validation-lambda
```

---

### Glue Logs

```text
/aws-glue/jobs
```

---

### Step Function Logs

```text
/stepfunctions/ads-processing
```

---

# IAM Roles

## Validation Lambda Role

Permissions:

* Read S3 raw bucket
* Write SQS DLQ
* Write CloudWatch Logs

---

## Glue Role

Permissions:

* Read raw bucket
* Write processed bucket
* Write analytics bucket
* Access Glue Catalog

---

## Step Function Role

Permissions:

* Invoke Lambda
* Start Glue Job
* Write CloudWatch Logs
