# LifeOS Database Structure

## Users Table
Stores information about each LifeOS user



| Column | Data Type | Rules | Description |
|--------|------------|-------|------------|
|id|Integer| Primary key, auto number|ID for the user|
|name| Text|Required  | user's name|
|email|Text|Required , UNIQUE | user's email address|
|password_hash| Text| Required | user's account password|
|created_at| DATETIME| Automatic| Date the account  was created|

## 2. Goals Table 
Stores the goals created by the user.


| Column | Data Type| Rules  | Description |
|--------|------------|-------|------------|
|id| INTEGER |Primary key, auto number|  user_id for the goal|
|user_id|   INTEGER| Required, links to users.id| Identifies which user owns the goal|
|title|Text|Required | Name of the goal|
|description|Text| Optional| Details about the goal|
|start_date| DATE| Optional| Date the goal start|
|due_date| DATE| Optional | Date the goal ends|
|progress| INTEGER| Default 0 , between 0 and 100 | Goal progress percentage|
|status| Text| Default "not started"| Current goals status   Not Started,  In progress and Completed |
|created_at| DATETIME| Automatic| Date the goal created|

----

## 3. Tasks Table 
Store Individual task that the user needs to complete
| Column | Data Type| Rules  | Description |
|--------|------------|------|-------------|
|id| INTEGER|Primary key, auto number| Unique for the task|
|goal_id| INTEGER| Primary key, auto number| Goal this task supports|
|user_id| INTEGER| Required, links to users.id| Which user owns this task|
|title| TEXT | Optional, links to goals.id| Name of the task|
|description| Text| Required| Details about the task|
|due_date| DATETIME| Optional| Date task should be completed|
|start_time| TIME|  OPTIONAL|  TIME the task is scheduled to start |
|is_completed| Boolean|Default false| Whether the task is completed|
|completed_at| DATETIME| Optional| When the rask is marked done|
|created_at|DATETIME| Automatic| Date the task created|


## 4. Daily Review
Stores user's daily reflections.


| Column | Data Type| Rules  | Description |
|--------|------------|------|-------------|
|id|INTEGER|Primary key, auto number| UNIQUE ID for the review|
|user_id| INTEGER|Required, links to users.id | Indentifies which user wrote the review|
| review_date|DATE| Required| Date of the review|
|content|TEXT| Required| User's reflection|
|created_at| DATETIME| Automatic| Date the review was created|
---

## 5. Projects Table

Stores projects the user is working on.

| Column | Data Type|Rules | Description |
|--------|-----------|-----|---------------|
| id | INTEGER| Primary key, auto number | Unique ID for the project |
| user_id | INTEGER| Required, linksto users.id | Identifies which user owns the project |
| title | TEXT|Required | Project name |
| description | TEXT| Optional | Project details |
| start_date | DATE| Optional | Project start date |
| due_date | DATE | Optional| Project deadline |
| status | TEXT | Default not started| Current project status "Not Started" , "In progress" and "Completed" |
| created_at | DATETIME| Automatic | Date the project was created |

---

# Relationships

Users → Goals  
Users → Tasks 
Users → Projects  
Users → Daily Reviews    

Goals → Tasks



### Schedule

LifeOS does not use a separate schedule table.

Scheduled activities are stored in the `tasks` table using
the `due_date` and `start_time` fields.

For example:

| title | due_date | start_time |
|-------|----------|------------|
| Study Python | 2026-10-07 | 09:00 |
| Mathematics | 2026-10-07 | 11:00 |
| Work on LifeOS | 2026-10-07 | 14:00 |

The dashboard can use this information to display the user's
"Today's Schedule".


