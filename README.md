🏠 Airbnb End-to-End Data Engineering Project
📋 Overview

This project implements a complete end-to-end data engineering pipeline for Airbnb data, demonstrating best practices in data warehousing, transformation, and analytics using Snowflake, dbt (Data Build Tool), and AWS.

The pipeline processes Airbnb listings, bookings, and hosts data through a medallion architecture (Bronze → Silver → Gold), implementing incremental loading, Slowly Changing Dimensions (SCD Type 2), and analytics-ready data models.

🏗️ Architecture
Data Flow
Source Data (CSV) → AWS S3 → Snowflake (Staging)
                          ↓
                 Bronze Layer (Raw)
                          ↓
                Silver Layer (Cleaned)
                          ↓
              Gold Layer (Analytics)
Tech Stack
☁️ Cloud Data Warehouse: Snowflake
🔄 Transformation Layer: dbt (Data Build Tool)
🪣 Cloud Storage: AWS S3
🧑‍💻 Version Control: Git
🐍 Language: Python 3.12+
Key dbt Features Used
Incremental Models
Snapshots (SCD Type 2)
Jinja Macros
Custom Macros
Data Testing & Documentation
📊 Data Model
🥉 Bronze Layer (Raw Data)

Raw ingestion layer with minimal transformations:

bronze_bookings → Raw booking transactions
bronze_hosts → Raw host data
bronze_listings → Raw property listings
🥈 Silver Layer (Cleaned Data)

Standardized and validated datasets:

silver_bookings → Cleaned booking records
silver_hosts → Enhanced host profiles with metrics
silver_listings → Standardized listings with pricing logic
🥇 Gold Layer (Analytics Ready)

Business-ready, analytics-optimized datasets:

obt → One Big Table (denormalized model for analytics)
fact → Fact table for dimensional modeling
Ephemeral models for intermediate transformations
📌 Slowly Changing Dimensions (SCD Type 2)

Tracked historical changes using snapshots:

dim_bookings → Booking history changes
dim_hosts → Host profile evolution
dim_listings → Listing attribute history
📁 Project Structure
AWS_DBT_Snowflake/
│
├── README.md
├── pyproject.toml
├── main.py
│
├── SourceData/
│   ├── bookings.csv
│   ├── hosts.csv
│   └── listings.csv
│
├── DDL/
│   ├── ddl.sql
│   └── resources.sql
│
└── aws_dbt_snowflake_project/
    │
    ├── dbt_project.yml
    ├── ExampleProfiles.yml
    │
    ├── models/
    │   ├── sources/
    │   ├── bronze/
    │   ├── silver/
    │   └── gold/
    │
    ├── macros/
    │   ├── generate_schema_name.sql
    │   ├── multiply.sql
    │   ├── tag.sql
    │   └── trimmer.sql
    │
    ├── analyses/
    │   └── explore.sql
    │
    ├── snapshots/
    │   ├── dim_bookings.yml
    │   ├── dim_hosts.yml
    │   └── dim_listings.yml
    │
    ├── tests/
    │   └── source_tests.sql
    │
    └── seeds/
📊 Key Features
End-to-end ELT pipeline using modern data stack
Medallion architecture implementation
Incremental processing for scalability
SCD Type 2 tracking using dbt snapshots
Reusable SQL macros with Jinja templating
Data quality testing and validation
Analytics-ready gold layer (fact + OBT model)
🚀 Future Enhancements
Integration with BI tools (Tableau / Power BI / Looker)

📌 Summary

This project demonstrates a production-style data engineering pipeline that transforms raw Airbnb data into structured, analytics-ready datasets using modern cloud data stack tools.
