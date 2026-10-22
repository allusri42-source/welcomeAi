# Sample dbt E-Commerce Analytics Project

## Overview

This project demonstrates a simple dbt analytics workflow using
sample e-commerce customer and order data.

## Tech Stack

- dbt Core
- PostgreSQL
- SQL
- Git and GitHub

## Project Structure

- seeds/: Sample customer and order CSV files
- models/staging/: Data cleaning and standardization
- models/marts/: Analytics-ready data models
- models/sources.yml: Source table definitions
- dbt_project.yml: Project configuration

## Data Models

### Staging
- stg_customers
- stg_orders

### Analytics
- dim_customers: Customer-level metrics and spending
- fct_orders: Order-level analytical dataset

## Setup

Install the PostgreSQL adapter:

    pip install dbt-postgres

Configure your dbt profile in ~/.dbt/profiles.yml.

## Run the Project

Load sample data:

    dbt seed

Validate your connection:

    dbt debug

Build models and execute tests:

    dbt build

Generate documentation:

    dbt docs generate

## Features

- SQL-based transformations
- Modular dbt models
- Reusable model references
- Data quality tests
- Customer analytics
- Order and revenue reporting
