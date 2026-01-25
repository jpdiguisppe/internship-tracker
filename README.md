# Internship Application Tracker (SQL)

A relational database project built with **SQLite** to track and analyze internship applications.

## Project Overview
This project models real-world internship tracking using a normalized SQL schema.
It allows users to track companies, roles, application status, deadlines, contacts,
and communication history.

## Database Design
Tables include:
- `companies` – company metadata (industry, location)
- `roles` – internship role details
- `applications` – application status, deadlines, source, salary
- `contacts` – recruiters and hiring managers
- `interactions` – interviews, emails, follow-ups

Relationships are enforced using foreign keys.

## Key SQL Concepts Used
- Table creation with primary and foreign keys
- One-to-many relationships
- `SELECT`, `WHERE`, `JOIN`
- Aggregations with `GROUP BY`
- Conditional logic using `CASE`
- Date filtering and ordering

## Example Queries
- View applications by status (Applied, Interviewing, Offer, Rejected)
- Track upcoming application deadlines
- Calculate offer rates by company
- View full interaction timeline for an application

## How to Run
```bash
sqlite3 internship_tracker.db < schema.sql
sqlite3 internship_tracker.db < seed_data.sql
sqlite3 internship_tracker.db
## In sqlite run(for easier visual):
.headers on
.mode column
## Then:
SELECT * FROM applications;

