# Internship Application Tracker

A **SQLite database project** for organizing internship applications and practicing relational database design and SQL reporting.

It tracks companies, roles, applications, contacts, and follow-up interactions. The repository contains a schema, demonstration data, and reporting queries; it does not include a graphical user interface.

## Database design

| Table | Purpose |
| --- | --- |
| `companies` | Company names, industries, and locations |
| `roles` | Role titles, levels, and remote status |
| `applications` | Application status, dates, source, salary, and notes |
| `contacts` | Company contacts and contact details |
| `interactions` | Application-related emails, interviews, next steps, and dates |

The schema defines primary and foreign keys to connect these tables. **SQLite requires `PRAGMA foreign_keys = ON;` for a connection to enforce foreign-key constraints.**

## Run it locally

Install the [SQLite command-line tool](https://www.sqlite.org/cli.html), then run these commands from the repository folder:

```bash
sqlite3 internship_tracker.db < schema.sql
sqlite3 internship_tracker.db < seed_data.sql
sqlite3 -header -column internship_tracker.db < example_queries.sql
```

The seed file contains sample records for demonstration. Note that its application deadlines are in **2025**; the dynamic "next seven days" report may return no rows when run later.

To explore the data interactively:

```bash
sqlite3 internship_tracker.db
```

Inside the SQLite prompt:

```sql
.headers on
.mode column
PRAGMA foreign_keys = ON;
SELECT status, COUNT(*) AS applications
FROM applications
GROUP BY status;
```

## Example reports

See [`example_queries.sql`](example_queries.sql) for SQL that:

- Lists application deadlines within the next seven days
- Groups applications by status and month
- Calculates offer rates by company
- Shows the interaction history for an application

## What this demonstrates

Normalized relational modeling; primary/foreign keys; joins; aggregation with `GROUP BY`; conditional expressions with `CASE`; and date filtering in SQLite.

**Repository files:** [Schema](schema.sql) · [Sample data](seed_data.sql) · [Example queries](example_queries.sql).
