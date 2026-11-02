-- Insert user
INSERT  OR IGNORE INTO user_table
    (id, user_name, email, password_hash)
VALUES
    (1, 'Karabo', 'karabo@example.com', 'temporary_hash');

-- Insert goal
INSERT  OR IGNORE INTO Goals_table
    (id, user_id, title, date_start, date_end)
VALUES
    (1, 1, 'Learning and Development', '2026-10-31', '2026-12-31');

-- Insert tasks
INSERT OR IGNORE INTO Task_Table
    (id, goal_id, user_id, title, description_task, due_date, start_time)
VALUES
    (1, 1, 1, 'Python', 'Connecting Flask', '2026-12-31', '09:00:00'),
    (2, 1, 1, 'Chinese HSK 3', 'Reviewing lesson 1', '2026-11-29', '10:00:00');

-- Check inserted tasks
SELECT * FROM Task_Table;



