# Group 5 — SQL Queries

A group assignment for ALU that builds and queries a school database (`alu_database`) in MySQL. All SQL lives in a single script: [`final_dumb.sql`](final_dumb.sql).

## Database Schema

The database models students, staff, and academics with the following tables:

| Table | Purpose |
|---|---|
| `Classroom` | Physical classrooms where courses are taught |
| `Students` | Student records |
| `Faculty` | Faculty/staff records |
| `Courses` | Courses offered |
| `Extra_Curricular_Activities` | Clubs and activities |
| `Student_Courses` | Junction table — links students to the courses they take (many-to-many) |
| `Student_Activities` | Junction table — links students to the activities they join (many-to-many) |

## What the Script Does

The script is organized into five sections, run in order:

1. **Create database** — creates `alu_database` if it doesn't exist and switches to it.
2. **Create tables** — defines the seven tables above.
3. **Insert data** — seeds each table with sample rows.
4. **Update, delete, select** — demonstrates basic CRUD operations on each main table.
5. **Joins and aggregates** — multi-table queries:
   - Students enrolled in a course, with the faculty teaching it and the classroom it's held in.
   - Students participating in an activity, with their faculty advisor.
   - A custom join chosen by the team.
   - A `COUNT` / `GROUP BY` query showing the number of students in each course.

## How to Run

Requires a running MySQL server.

```bash
mysql -u <username> -p < final_dumb.sql
```

Or from the MySQL shell:

```sql
SOURCE final_dumb.sql;
```

## Status

The script is currently a **scaffold**: the section headers and comments are in place, and each team member fills in the SQL under their assigned section.

## Team

Group 5 — African Leadership University
