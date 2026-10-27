Create Table IF NOT EXISTS user_table(

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Create Table IF NOT EXISTS Goals_table(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL  REFERENCES user_table(id),
    title VARCHAR(100) NOT NULL,
    description_goals Text NULL,
    date_start  DATE NOT NULL,
    date_end DATE NOT NULL,
    progress INTEGER DEFAULT 0,
    status_line  Text  Default 'Not Started',
    created_at TimeStamp Default Current_Timestamp

);

Create Table IF NOT EXISTS  Task_Table(
    id INTEGER Primary key AUTOINCREMENT,
    goal_id INTEGER NOT NULL  REFERENCES Goals_table(id),
    user_id INTEGER NOT NULL REFERENCES user_table(id),
    title Text NOT NULL,
    description_task TEXT NOT NULL,
    due_date DATE NOT NULL,
    start_time Timestamp Not NULL,
    is_completed Boolean Default False,
    completed_at Timestamp Null,
    created_at Timestamp Default Current_timestamp
);

Create  Table IF NOT EXISTS Daily_Review(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL  REFERENCES user_table(id),
    review_date DATE NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRRENT_TIMESTAMP
);

Create Table IF NOT EXISTS Project_Table(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL  REFERENCES user_table(id),
    title TEXT NOT NULL,
    description_project TEXT NULL, 
    date_start  Date NOT NULL,
    due_date Date Not NULL,
    project_status TEXT DEFAULT 'NOT STARTED',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP

)
