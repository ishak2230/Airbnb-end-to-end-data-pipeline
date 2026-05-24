# 🏠 Airbnb End-to-End Data Engineering Pipeline

![dbt](https://img.shields.io/badge/dbt-Data%20Transform-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-blue)
![AWS](https://img.shields.io/badge/AWS-S3-yellow)
![Python](https://img.shields.io/badge/Python-3.12+-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## 📊 Architecture Overview

![Architecture](https://via.placeholder.com/1000x450.png?text=Medallion+Architecture+Bronze+%E2%86%92+Silver+%E2%86%92+Gold)

This project implements a modern **ELT data pipeline** using a **Medallion Architecture (Bronze → Silver → Gold)** on Snowflake with dbt transformations.

---

## 📋 Overview

This project demonstrates an end-to-end **data engineering pipeline for Airbnb data** using:

- ☁️ Snowflake (Data Warehouse)
- 🔄 dbt (Data Transformations)
- 🪣 AWS S3 (Data Storage)
- 🧠 Medallion Architecture

It processes **Airbnb listings, bookings, and hosts data** into analytics-ready datasets with **incremental loading and SCD Type 2 tracking**.

---

## 🏗️ Tech Stack

| Layer | Technology |
|------|------------|
| Storage | AWS S3 |
| Warehouse | Snowflake |
| Transformation | dbt |
| Language | Python |
| Version Control | Git |

---

## 🔄 Data Flow

```text
CSV Files → AWS S3 → Snowflake (Staging)
                          ↓
                    Bronze Layer (Raw Data)
                          ↓
                   Silver Layer (Cleaned)
                          ↓
               Gold Layer (Analytics Ready)

