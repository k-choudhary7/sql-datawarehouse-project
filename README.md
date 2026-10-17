### End-to-End Data Warehouse & Analytics Project

# 📌 Project Overview

This repository contains a hands-on Data Warehouse and Analytics project using Microsoft SQL Server.

The project was completed as a learning and portfolio project based on the Data With Baraa Data Warehouse and Analytics tutorial. The objective was to gain practical experience designing and implementing an end-to-end data warehouse, from raw source data through data transformation, dimensional modeling, and analytical reporting.

The project integrates data from two source systems, ERP and CRM, provided as CSV files, and transforms the data into a centralized analytical data warehouse.

The solution follows a Medallion Architecture:

```text
Source Systems
     │
     ▼
🥉 Bronze Layer
Raw Data
     │
     ▼
🥈 Silver Layer
Cleansed & Standardized Data
     │
     ▼
🥇 Gold Layer
Business-Ready Data
     │
     ▼
Analytics & Reporting
```

# 🎯 Project Objectives

The primary objective of this project was to understand and practice the complete data warehouse development lifecycle.

The project focuses on:

* Integrating ERP and CRM source data
* Designing a layered data warehouse architecture
* Building SQL-based ETL processes
* Loading raw source data into a Bronze layer
* Cleansing and standardizing data in the Silver layer
* Integrating data from multiple source systems
* Building a business-ready Gold layer
* Designing fact and dimension tables
* Implementing a Star Schema
* Performing data quality validation
* Developing SQL-based analytical queries
* Generating insights into customer behavior, product performance, and sales trends

The original project requirements specify integrating the two source systems into a single user-friendly analytical model while focusing on the latest available dataset rather than historizing the data.

# 🏗️ Data Architecture

The project uses a Medallion Architecture consisting of three data processing layers:

```text

                    ┌──────────────────────┐
                    │    Source Systems    │
                    │                      │
                    │      ERP + CRM       │
                    │      CSV Files       │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   🥉 Bronze Layer    │
                    │                      │
                    │      Raw Data        │
                    │   Data Ingestion     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   🥈 Silver Layer    │
                    │                      │
                    │ Cleansing            │
                    │ Standardization      │
                    │ Transformation       │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    🥇 Gold Layer    │
                    │                      │
                    │ Business-Ready Data  │
                    │    Star Schema       │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Analytics & Reporting│
                    │                      │
                    │ Customer             │
                    │ Product              │
                    │ Sales                │
                    └──────────────────────┘
```

The architecture separates data ingestion, transformation, and analytical consumption, making the data flow easier to understand, maintain, validate, and extend.

# 🥉 Bronze Layer — Raw Data

## Purpose

The Bronze layer is the raw data ingestion layer.

Data from the ERP and CRM CSV files is loaded into SQL Server with minimal transformation.

The primary objective is to preserve the source data and provide a reliable foundation for downstream processing.

## Responsibilities

* Load ERP source data
* Load CRM source data
* Preserve the source structure
* Store raw source records
* Provide the foundation for downstream transformation
* Separate source ingestion from business transformation

## Data Flow
```text
ERP CSV Files ──────┐
                    ├──────► Bronze Tables
CRM CSV Files ──────┘
```

## Key Principle

The Bronze layer focuses on:

### "What did we receive from the source systems?"

Business transformations are intentionally minimized at this stage.

# 🥈 Silver Layer — Cleansed & Standardized Data

## Purpose

The Silver layer transforms raw Bronze data into clean, standardized, validated, and trusted data.

This is the primary transformation and data-quality layer.

The original project requirements specifically call for cleansing and resolving data quality issues before the data is used for analysis.

## Responsibilities

* Cleanse raw data
* Handle missing and NULL values
* Remove duplicate records where appropriate
* Standardize data formats
* Standardize data types
* Resolve inconsistent values
* Apply transformation rules
* Normalize data where required
* Validate data quality
* Prepare data for analytical modeling

## Data Flow

```text
Bronze Tables
      │
      ▼
Data Quality Checks
      │
      ▼
Cleansing
      │
      ▼
Standardization
      │
      ▼
Transformation
      │
      ▼
Silver Tables
```

## Key Principle

The Silver layer answers:

### "Can we trust and consistently use this data?"

The result is a trusted dataset that can be used to build the Gold analytical layer.

# 🥇 Gold Layer — Business-Ready Data

## Purpose

The Gold layer is the business-facing analytical layer.

Data from the Silver layer is transformed into business-ready models designed for reporting and analytical queries.

The project uses dimensional modeling and a Star Schema for the Gold layer.

## Responsibilities

* Create business-ready datasets
* Build fact tables
* Build dimension tables
* Establish relationships between facts and dimensions
* Apply business-oriented transformations
* Optimize data for analytical queries
* Provide a simplified model for reporting and analysis

## Data Flow
```text
Silver Tables
      │
      ▼
Business Transformations
      │
      ▼
Dimensional Modeling
      │
      ├───────────────┐
      ▼               ▼
Fact Tables     Dimension Tables
      │               │
      └───────┬───────┘
              ▼
         Gold Layer
              │
              ▼
     Analytics & Reporting
```

## Key Principle

The Gold layer answers:

### "How can the business analyze this data?"

The Gold layer hides much of the complexity of the underlying source systems and provides a business-friendly analytical model.

# 🔄 Bronze vs Silver vs Gold

Layer        | Purpose              | Data State               | Main Activities
------------ | -------------------- | ------------------------ | -------------------
🥉 Bronze    | Data Ingestion       | Raw                      | Load and preserve source data
🥈 Silver    | Data Transformation  | Cleansed & Standardized  | Clean, validate, transform
🥇 Gold      | Data Consumption     | Business-Ready           | Dimensional modeling and analytics

## Simple way to remember

Bronze = What did we receive?
Silver = Can we trust and use it?
Gold = How can the business analyze it?

# 🔄 End-to-End ETL Process

The project implements a complete ETL flow using SQL Server.
```text
┌───────────────────────┐
│     ERP CSV Files     │
└───────────┬───────────┘
            │
            │
┌───────────▼───────────┐
│     CRM CSV Files     │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│     Bronze Layer      │
│                       │
│   Raw Data Ingestion  │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│     Silver Layer      │
│                       │
│ Cleansing             │
│ Standardization       │
│ Validation             │
│ Transformation        │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│      Gold Layer       │
│                       │
│ Fact & Dimension      │
│ Tables                │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│ Analytics & Reporting │
│                       │
│ Customer Insights     │
│ Product Insights      │
│ Sales Insights        │
└───────────────────────┘
```

# 🧹 Data Quality

Data quality activities are primarily performed during the Silver-layer transformation process.

The objective is to ensure that the data used by the Gold layer is consistent, standardized, and suitable for analytical workloads.

Key areas include:

* Duplicate detection and handling
* NULL and missing-value handling
* Data type validation
* Standardization of values
* Date format consistency
* Numeric format consistency
* Invalid-value handling
* Source-system consistency
* Referential integrity validation

# 📐 Data Modeling

The Gold layer uses dimensional modeling to organize the data for analytical workloads.

The model follows a Star Schema consisting of fact and dimension tables.

## Fact Tables

Fact tables represent measurable business events.

They typically contain:

* Business event identifiers
* Foreign keys to dimensions
* Quantitative measures
* Metrics used for aggregation

## Dimension Tables

Dimension tables provide descriptive context for analytical queries.

Examples include:

* Customer
* Product
* Date
* Other relevant business dimensions

## Example Star Schema
```text
                 ┌─────────────────┐
                 │  Dim Customer   │
                 └────────┬────────┘
                          │
                          │
┌────────────────┐   ┌────▼─────┐   ┌────────────────┐
│  Dim Product   │───│ Fact Sales│───│    Dim Date    │
└────────────────┘   └────┬─────┘   └────────────────┘
                          │
                          │
                   ┌──────▼──────┐
                   │     Other   │
                   │ Dimensions  │
                   └─────────────┘
```

## Modeling Objectives

The model was designed to support:

* Simple analytical queries
* Clear relationships between facts and dimensions
* Consistent business definitions
* Reusable dimensions
* Efficient reporting and aggregation
* Business-friendly data structures

# 📊 Analytics & Business Insights

The Gold layer enables SQL-based analytics focused on three major areas defined by the project requirements: customer behavior, product performance, and sales trends.

## 👤 Customer Analysis

Examples of questions that can be answered:

* Who are the highest-value customers?
* Which customers generate the most revenue?
* How are customers distributed across different segments?
* What customer trends can be identified?

## 📦 Product Analysis

Examples include:

* Which products generate the highest sales?
* Which product categories perform best?
* What are the top-performing products?
* How does product performance change over time?

## 💰 Sales Analysis

Examples include:

* What are the monthly and yearly sales trends?
* Which periods generate the highest revenue?
* Which products contribute most to sales?
* Which customers contribute most to revenue?
* How does sales performance change over time?

## 🛠️ Technology Stack

Technology                          | Purpose
----------------------------------- | --------------------------------------
Microsoft SQL Server                | Data warehouse platform
T-SQL                               | ETL, transformation, and analytics
SQL Server Management Studio (SSMS) | Database development and management
CSV                                 | Source data format
Draw.io                             | Architecture, data flow, and data modeling diagrams
Git / GitHub                        | Version control and project management

# 📂 Repository Structure

```text
sql-datawarehouse-project/
│
├── datasets/
│   └── # ERP and CRM source CSV datasets
│
├── documents/
│   ├── etl.drawio
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── data_catalog.md
│   ├── naming-conventions.md
│   └── requirements.md
│
├── scripts/
│   ├── bronze/
│   │   └── # Raw data ingestion scripts
│   │
│   ├── silver/
│   │   └── # Data cleansing and transformation scripts
│   │
│   └── gold/
│       └── # Analytical model creation scripts
│
├── tests/
│   └── # Data quality and validation scripts
│
├── README.md
├── LICENSE
├── .gitignore
└── requirements.txt
```

The repository organization separates datasets, architecture documentation, ETL scripts, tests, and project documentation.

# 📚 Project Documentation

The repository contains supporting documentation for the major components of the solution.

Document                  | Description
------------------------- | ----------------------------------------------------------
data_architecture.drawio  | Overall data warehouse architecture
data_flow.drawio          | Data movement through the architecture
data_models.drawio        | Data models and Star Schema
etl.drawio                | ETL processes and techniques
data_catalog.md           | Dataset and field-level documentation
naming-conventions.md     | Naming standards
requirements.md           | Project requirements and business objectives

# 🧪 Testing & Validation

The project includes a dedicated tests/ directory for data quality and validation scripts.

Testing and validation are important to ensure that:

* Data is loaded correctly
* Expected records are available
* Transformations produce the expected results
* Data quality issues are identified
* Relationships between datasets remain valid
* The Gold layer contains reliable analytical data

# 🎓 Skills Demonstrated

## Data Architecture

* Medallion Architecture
* Layered data architecture
* Data flow design
* Data warehouse architecture

## Data Engineering

* ETL development
* SQL Server
* T-SQL
* Data ingestion
* Data transformation
* Data cleansing
* Data quality

## Data Modeling
* Dimensional modeling
* Star Schema
* Fact tables
* Dimension tables
* Analytical data modeling

## Data Analytics
* SQL analytics
* Customer analysis
* Product analysis
* Sales analysis
* Business metrics

## Engineering Practices

* Git/GitHub
* Documentation
* Data cataloging
* Naming conventions
* Data validation
* Testing

# 💡 Key Learning Outcomes

This project provided hands-on experience with the complete data warehouse development lifecycle.

Key learning outcomes include:

Understanding how to design a layered data architecture
Understanding the purpose of Bronze, Silver, and Gold layers
Building SQL-based ETL pipelines
Working with raw source data
Handling data quality issues
Standardizing and transforming data
Integrating multiple source systems
Designing fact and dimension tables
Building a Star Schema
Developing analytical SQL queries
Documenting data architecture and data models
Managing project code using Git and GitHub

# 🚀 Project Outcome

The completed solution demonstrates how data can be transformed from raw operational source files into a structured analytical data warehouse.

The overall data journey is:

Raw Source Data
      │
      ▼
Data Ingestion
      │
      ▼
Data Cleansing & Standardization
      │
      ▼
Data Integration
      │
      ▼
Dimensional Modeling
      │
      ▼
Business-Ready Data
      │
      ▼
Analytics & Insights

The final solution provides a foundation for analyzing:

Customer behavior
Product performance
Sales trends
Business performance

# 🙏 Acknowledgments & Learning Context

This project was completed as a learning and portfolio project based on the Data Warehouse and Analytics tutorial by Data With Baraa.

The tutorial provided the foundation and guidance for learning the overall project structure, Medallion Architecture, SQL Server data warehousing, ETL processes, data modeling, and analytics.

I followed the tutorial to gain hands-on experience and develop a practical understanding of how an end-to-end data warehouse is designed and implemented.

### What I Practiced

Through this project, I gained hands-on experience with:
Bronze, Silver, and Gold architecture
SQL Server data warehousing
ERP and CRM data integration
SQL-based ETL
Data cleansing and standardization
Data quality validation
Dimensional modeling
Star Schema design
Fact and dimension tables
Analytical SQL
Data architecture documentation
Data modeling documentation
Git and GitHub

### Learning Objective

The primary objective was to move beyond theoretical knowledge and gain practical experience building a complete data warehouse from source data through analytical consumption.

The project helped me understand the complete data journey:

Source Data → Ingestion → Transformation → Data Modeling → Analytics

### Original Tutorial

Credit and acknowledgment are given to Data With Baraa for the original tutorial and learning material that inspired this project.

Note: This repository represents my implementation of the project for learning and portfolio purposes. It is not presented as an original tutorial created by me.
