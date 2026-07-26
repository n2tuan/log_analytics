--duckdb duckdb/log_analytics.duckdb < sql/01_ddl.sql 
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS log_staging;
CREATE SCHEMA IF NOT EXISTS log_mart;