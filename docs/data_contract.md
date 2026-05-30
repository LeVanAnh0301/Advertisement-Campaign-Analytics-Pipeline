# Data Contract

## Dataset Name

Advertisement Campaign Analytics Dataset

---

## Required Columns

| Column Name        | Data Type | Required |
| ------------------ | --------- | -------- |
| user_id            | string    | Yes      |
| timestamp          | timestamp | Yes      |
| device_type        | string    | Yes      |
| location           | string    | Yes      |
| age_group          | string    | Yes      |
| gender             | string    | Yes      |
| ad_id              | string    | Yes      |
| content_type       | string    | Yes      |
| ad_topic           | string    | Yes      |
| ad_target_audience | string    | Yes      |
| click_through_rate | double    | Yes      |
| conversion_rate    | double    | Yes      |
| engagement_level   | string    | Yes      |
| view_time          | integer   | Yes      |
| cost_per_click     | double    | Yes      |
| ROI_Category       | string    | Yes      |

---

## Supported Values

### device_type

Allowed values:

* Mobile
* Desktop
* Tablet

---

### gender

Allowed values:

* Male
* Female

---

### ROI_Category

Allowed values:

* Low
* Medium
* High

---

## Validation Rules

### Rule 1

All required columns must exist.

---

### Rule 2

The dataset must contain at least one record.

---

### Rule 3

ROI_Category must be one of:

```text
Low
Medium
High
```

---

### Rule 4

click_through_rate must be numeric.

---

### Rule 5

conversion_rate must be numeric.

---

### Rule 6

view_time must be greater than or equal to zero.
