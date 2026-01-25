-- Drop tables if they already exist (for resetting during dev)
DROP TABLE IF EXISTS interactions;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS companies;

-- 1) Companies
CREATE TABLE companies (
    company_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name         TEXT NOT NULL,
    industry     TEXT,
    location     TEXT
);

-- 2) Roles
CREATE TABLE roles (
    role_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    title     TEXT NOT NULL,
    level     TEXT,
    is_remote INTEGER DEFAULT 0  -- 0 = false, 1 = true
);

-- 3) Applications
CREATE TABLE applications (
    application_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id      INTEGER NOT NULL,
    role_id         INTEGER NOT NULL,
    applied_date    TEXT,     -- store as 'YYYY-MM-DD'
    status          TEXT NOT NULL,
    deadline_date   TEXT,     -- 'YYYY-MM-DD' or NULL
    source          TEXT,
    salary          REAL,
    notes           TEXT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (role_id)    REFERENCES roles(role_id)
);

-- 4) Contacts
CREATE TABLE contacts (
    contact_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id  INTEGER NOT NULL,
    name        TEXT NOT NULL,
    email       TEXT,
    role        TEXT,
    notes       TEXT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- 5) Interactions
CREATE TABLE interactions (
    interaction_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    application_id   INTEGER NOT NULL,
    interaction_date TEXT NOT NULL,  -- 'YYYY-MM-DD'
    type             TEXT NOT NULL,
    summary          TEXT,
    next_step        TEXT,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);