-- Companies
INSERT INTO companies (name, industry, location) VALUES
  ('Google', 'Tech', 'Mountain View, CA'),
  ('Cencora', 'Healthcare / SAP', 'Conshohocken, PA'),
  ('Amazon', 'Tech', 'Seattle, WA'),
  ('Local Startup', 'Tech', 'Philadelphia, PA');

-- Roles
INSERT INTO roles (title, level, is_remote) VALUES
  ('Software Engineering Intern', 'Junior', 0),
  ('Data Analyst Intern', 'Sophomore/Junior', 1),
  ('Backend Developer Intern', 'Junior', 0),
  ('Full Stack Intern', 'Junior', 1);

-- Applications
INSERT INTO applications (
    company_id, role_id, applied_date, status,
    deadline_date, source, salary, notes
) VALUES
  (1, 1, '2025-11-10', 'Applied',        '2025-12-01', 'LinkedIn',   NULL, 'Referred by alumni'),
  (2, 2, '2025-11-05', 'Interviewing',   '2025-11-30', 'Handshake',  30.00, 'SAP / data-heavy'),
  (3, 3, '2025-10-20', 'Rejected',       '2025-11-01', 'Company Site', 35.00, 'OA was tough'),
  (4, 4, '2025-10-25', 'Offer',          NULL,         'Referral',   28.50, 'Very chill team');

-- Contacts
INSERT INTO contacts (company_id, name, email, role, notes) VALUES
  (1, 'Alice Recruiter', 'alice@google.com', 'Recruiter', 'Met at career fair'),
  (2, 'Bob Manager', 'bob@cencora.com', 'Hiring Manager', 'Follow up after interview'),
  (4, 'Startup CTO', 'cto@startup.com', 'CTO', 'Good culture fit');

-- Interactions
INSERT INTO interactions (application_id, interaction_date, type, summary, next_step) VALUES
  (1, '2025-11-11', 'Email', 'Thank-you email after application', 'Wait for response'),
  (2, '2025-11-06', 'Phone Screen', 'Talked about SQL + Python', 'Schedule technical round'),
  (2, '2025-11-12', 'Interview', 'Technical interview, medium difficulty', 'Waiting on decision'),
  (4, '2025-10-28', 'Offer Call', 'Received verbal offer', 'Review offer, accept or decline');