# Storing and Retrieving Data – Relational Database for a Flower Shop (2025)

This project demonstrates the design, development, and querying of a **Relational Database System** for a fictitious flower shop based in Portugal. The goal was to create a scalable and normalized database that supports everyday business operations — including customer management, sales, inventory, ratings, and invoices — while answering key business questions via SQL queries and views.

---

## Business Scenario

We modeled a small flower shop that sells floral arrangements, potted plants, and accessories both in-store and online. Customers can rate their purchases, and the business wants to monitor sales trends, customer preferences, stock levels, and employee performance.

---

## Deliverables

- SQL script to fully recreate the **Entire Database Structure** and **Populate Sample Data**
- Functional ERD with **8+ normalized tables**
- Triggers, Views, and Queries aligned with real business questions

---

## Database Design

- Designed using **MySQL Workbench**
- Normalized to **Third Normal Form (3NF)**
- Final ERD includes:
  - Tables: `Customers`, `Orders`, `Products`, `OrderDetails`, `Employees`, `Ratings`, `Log`, `PaymentMethods`, and more
  - **1:N**, **N:M** relationships modeled via junction tables
  - Customers can rate products (1–5 stars) with comments

---

## Features Implemented

### Triggers
- **Trigger 1 – Update Stock on Sale**: Reduces stock quantity automatically when an order is placed  
- **Trigger 2 – Logging Changes**: Inserts logs into a `Log` table upon stock updates

### Invoice Generation
- Created two **MySQL views** to dynamically generate invoices:  
  - `view_invoice_header`: customer, date, totals  
  - `view_invoice_details`: itemized line items  
- These views are generated directly from base tables, not pre-built invoice tables

---

## Data Insertion

- Inserted **20–30 sample transactions**, including data for **2+ years**
- Used generated + random data to ensure meaningful variation in customer behavior and product sales
- Product ratings range from 1–5 stars

---

## Tools Used

- MySQL
---

## Learning Outcomes

- Designed and normalized a relational database from scratch  
- Practiced real-world SQL use cases (joins, aggregates, subqueries, views, triggers)  
- Understood database design methodologies and justification for data modeling choices  
- Delivered full-stack documentation and demonstration in a simulated business setting

---

## Developed By
- **Moeko Mitani** [LinkedIn](https://www.linkedin.com/in/moeko-mitani/)  
- Afonso Gamito
- Catarina Carneiro
- Gonçalo Pacheco
- Hassan Bhatti
