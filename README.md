# 🏠 Airbnb Bookings End-to-End Data Pipeline

## 📋 Overview

This project implements a complete end-to-end data engineering pipeline for Airbnb data using modern cloud technologies. The solution demonstrates best practices in data warehousing, transformation, and analytics using **Snowflake**, **dbt (Data Build Tool)**, and **AWS**.

The pipeline processes Airbnb listings, bookings, and hosts data through a **Medallion Architecture (Bronze → Silver → Gold)** while implementing:

- Incremental loading
- Slowly Changing Dimensions (SCD Type 2)
- Analytics-ready datasets
- Data quality testing and documentation

---

## 🏗️ Architecture

### Data Flow

```text
Source Data (CSV)
      ↓
AWS S3
      ↓
Snowflake (Staging)
      ↓
Bronze Layer
      ↓
Silver Layer
      ↓
Gold Layer
