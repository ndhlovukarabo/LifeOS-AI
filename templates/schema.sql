Create Table IF NOT EXISTS user_table(

    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

Create Table IF NOT EXISTS Goals_table(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL FOREIGN KEY REFRENCES user_table(id),
    title VARCHAR(100) NOT NULL,
    description_title Text NULL,
    date_start  DATE NOT NULL,
    date_end DATE NOT NULL,
    progress INT DEFAULT 0,
    status_line  Text  Default "Not Started",
    created_at TimeStamp Default Current_Timestamp,

);

Create Table IF NOT EXISTS  Task_Table(
    id INT Primary key Auto_increment;
    goal_id INT NOT NULL FOREIGN KEY REFERENCES Goals_table(id),
    user_id INT NOT NULLL FOREIGN KEY REFERENCES user_table(id),
    title Text NOT NULL;
    description_task TEXT NOT NULL,
    due_date DATE NOT NULL,
    start_time Timestamp Not NULL,
    is_completed Boolean Default False,
    completed_at Timestamp Null,
    created_at Timestamp Default Current_timestamp
);

Create  Table IF NOT EXISTS Daily_Review(
    id INT PRIMARY KEY AUTO_INCEMENT,
    user_id INT NOT NULL FOREIGN KEY REFERENCES user_table(id),
    review_date DATE NOT NULL,
    content TEXT NOT NULL,
    crreated_at DATETIME DEFAULT CURRRENT_TIMESTAMP,
);

Create Table IF NOT EXISTS Project_Table(
    id INT PRIMARY KEEY AUTO_INCREMENT,
    user_id INT NOT NULL FOREIGN KEY REFERENCES User_table(id),
    title TEXT NOT NULL,
    description_project TEXT NULL, 
    start_date Date NOT NULL,
    due_date Date Not NULL,
    project_status TEXT DEFAULT "NOT STARTED",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

)
