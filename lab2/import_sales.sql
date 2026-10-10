DROP TABLE IF EXISTS sales_report;
CREATE TABLE sales_report (metric VARCHAR(50), value NUMERIC(14,2));
\copy sales_report FROM '/Users/ekaterinarasskazova/security_systems/lab2/sales_report.csv' WITH (FORMAT csv, HEADER true);
