# 🏠 Airbnb End-to-End Data Engineering Project

## 📋 Overview

This project demonstrates a complete **end-to-end data pipeline** for Airbnb data using modern cloud technologies. It includes cloud data warehousing, incremental data processing, Slowly Changing Dimensions (SCD Type 2), and dimensional modeling.

The pipeline ingests Airbnb listings, bookings, and host data from AWS S3, transforms it through a **Medallion Architecture (Bronze → Silver → Gold)** using **Snowflake** and **dbt**, and produces analytics-ready datasets optimized for reporting and business intelligence.

---

## 🏗️ Architecture

### Architecture Overview

```
                +--------------------+
                |   Airbnb CSV Data  |
                | bookings.csv       |
                | hosts.csv          |
                | listings.csv       |
                +---------+----------+
                          |
                          |
                    AWS S3 Bucket
                          |
                          ▼
             +-------------------------+
             | Snowflake STAGING Layer |
             | AIRBNB.STAGING          |
             +------------+------------+
                          |
                          ▼
            +---------------------------+
            |     BRONZE Layer          |
            |   AIRBNB.BRONZE           |
            |---------------------------|
            | bronze_bookings           |
            | bronze_hosts              |
            | bronze_listings           |
            +------------+--------------+
                         |
                         ▼
            +---------------------------+
            |      SILVER Layer         |
            |    AIRBNB.SILVER          |
            |---------------------------|
            | silver_bookings           |
            | silver_hosts              |
            | silver_listings           |
            +------------+--------------+
                         |
                         ▼
            +---------------------------+
            |       GOLD Layer          |
            |     AIRBNB.GOLD           |
            |---------------------------|
            | One Big Table (OBT)       |
            | Fact Table                |
            | Dimension Tables          |
            | Snapshots (SCD Type 2)    |
            +------------+--------------+
                         |
                         ▼
                Analytics & Reporting
```

---

## 🚀 Pipeline Components

### 1. Source Layer

Raw Airbnb datasets are stored as CSV files in **AWS S3**.

**Datasets**

- bookings.csv
- hosts.csv
- listings.csv

---

### 2. Staging Layer (`AIRBNB.STAGING`)

Initial ingestion layer inside Snowflake.

Responsibilities:

- Load raw CSV files from AWS S3
- Preserve original schema
- Minimal transformation
- Source validation

---

### 3. Bronze Layer (`AIRBNB.BRONZE`)

Stores raw data with incremental loading.

Models:

- `bronze_bookings`
- `bronze_hosts`
- `bronze_listings`

Features:

- Incremental loading
- Raw historical storage
- Minimal business logic
- Foundation for downstream transformations

---

### 4. Silver Layer (`AIRBNB.SILVER`)

Data cleansing, validation, and standardization.

Models:

- `silver_bookings`
- `silver_hosts`
- `silver_listings`

Features:

- Data quality validation
- Null handling
- Standardized formats
- Business rule enforcement
- dbt tests
- Reusable custom macros

Custom dbt Macros:

- `multiply()`
- `tag()`
- `trimmer()`

---

### 5. Gold Layer (`AIRBNB.GOLD`)

Analytics-ready dimensional model.

Components:

- One Big Table (OBT)
- Fact Table
- Dimension Tables
- Ephemeral Models
- dbt Snapshots

Features:

- Metadata-driven SQL generation using Jinja
- Star Schema
- Historical tracking using SCD Type 2
- Optimized for BI and analytics

---

## ⭐ Gold Layer Design

### One Big Table (OBT)

A denormalized table joining all Silver models into a single analytics dataset.

Includes:

- Booking information
- Listing information
- Host information

---

### Ephemeral Models

Intermediate transformations built using dbt Ephemeral models.

Models:

- `bookings.sql`
- `hosts.sql`
- `listings.sql`

---

### Fact Table

The central transactional table that joins OBT with dimension tables.

Contains:

- Booking metrics
- Foreign keys
- Business measures

---

### Dimension Tables

Generated using dbt Snapshots.

- `dim_hosts`
- `dim_listings`
- `dim_bookings`

Implemented using:

- Slowly Changing Dimension Type 2
- Timestamp-based change tracking
- Historical versioning

---

## 📊 Medallion Architecture

### 🥉 Bronze Layer

Raw data copied from staging with minimal transformations.

| Table | Description |
|--------|-------------|
| bronze_bookings | Raw booking transactions |
| bronze_hosts | Raw host information |
| bronze_listings | Raw Airbnb listings |

---

### 🥈 Silver Layer

Cleaned and validated datasets.

| Table | Description |
|--------|-------------|
| silver_bookings | Validated booking records |
| silver_hosts | Enhanced host profiles |
| silver_listings | Standardized listing information |

---

### 🥇 Gold Layer

Business-ready analytical models.

| Model | Description |
|--------|-------------|
| obt | One Big Table |
| fact | Central fact table |
| dim_hosts | Host dimension |
| dim_listings | Listing dimension |
| dim_bookings | Booking dimension |

---

## 🕒 Slowly Changing Dimensions (SCD Type 2)

Historical tracking is implemented using **dbt Snapshots**.

Tracked Dimensions:

- `dim_hosts`
- `dim_listings`
- `dim_bookings`

---

## 🔄 Data Flow

```
CSV Files
     │
     ▼
 AWS S3 Bucket
     │
     ▼
Snowflake STAGING
     │
     ▼
Bronze Layer
     │
     ▼
Silver Layer
     │
     ▼
Gold Layer
     │
     ▼
Analytics / BI
```

---

## 🛠️ Technology Stack

| Category | Technology |
|----------|------------|
| Cloud Data Warehouse | Snowflake |
| Data Transformation | dbt |
| Cloud Storage | AWS S3 |
| Programming Language | Python 3.12+ |
| Version Control | Git & GitHub |
| SQL | Snowflake SQL |
| Templating | Jinja |

---

## ⚙️ Key dbt Features

- Incremental Models
- Snapshots (SCD Type 2)
- Custom Macros
- Jinja Templating
- Data Quality Tests
- Documentation Generation
- Ephemeral Models
- Metadata-Driven SQL

---

## 🔒 Security

The project follows Snowflake security best practices, including:

- Role-Based Access Control (RBAC)
- Secure credential management
- Controlled schema permissions
- Secure database connections

---

## 📈 End Result

The pipeline delivers a fully automated analytics platform that:

- Ingests raw Airbnb data from AWS S3
- Performs incremental processing
- Cleans and validates data
- Tracks historical changes using SCD Type 2
- Creates analytics-ready fact and dimension tables
- Implements a scalable Medallion Architecture
- Produces optimized datasets for BI dashboards and reporting


## Dashboard

<img width="1303" height="726" alt="image" src="https://github.com/user-attachments/assets/69c58a92-2a62-4376-871a-4e7858c00553" />
<img width="717" height="735" alt="image" src="https://github.com/user-attachments/assets/2a8d24d5-5547-4d04-832b-5279046efe89" />




---
