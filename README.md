# 🏅 DB-Assignment-4 — Olympic World Committee Database

##  Project Description

This database models an information system for the **Olympic World Committee**, used to collect, track, and analyze sports results, athlete participation, competition venues, coaching assignments, and athlete identification documents.

## 🎯 Business Case

This system addresses the following tasks:

- Storing complete athlete information: full name, gender, date of birth, nationality.
- Tracking competition results (rank, score, date, discipline).
- Analyzing average performance of athletes across disciplines.
- Generating rankings for media and strategic planning.
- Managing event venue data and locations.
- Linking coaches to specific disciplines.
- Storing passport data to verify athlete eligibility and compliance.

##  Database Structure

- `athletes`: contains personal information about athletes.
- `disciplines`: contains normalized names of sport disciplines.
- `venues`: stores locations where competitions take place.
- `results`: records athlete performance results (linked to athletes, venues, disciplines).
- `coaches`: contains data about coaches.
- `discipline_coach`: many-to-many relationship between coaches and disciplines.
- `athlete_passports`: stores sensitive athlete passport information.

![Untitled (2)](https://github.com/user-attachments/assets/9c9277a0-30ad-497a-bcce-a857756e07d2)

| Relationship                                         | Type | Description                                      |
| ---------------------------------------------------- | ---- | ------------------------------------------------ |
| `athletes` → `results`                               | 1\:N | One athlete can have many results.               |
| `disciplines` → `results`                            | 1\:N | One discipline appears in many results.          |
| `venues` → `results`                                 | 1\:N | One venue hosts many results.                    |
| `athletes` → `athlete_passports`                     | 1\:N | One athlete can have multiple passports.         |
| `disciplines` ↔ `coaches` *(via `discipline_coach`)* | M\:N | Many coaches can train many disciplines.         |
| `coaches` ↔ `disciplines` *(via `discipline_coach`)* | M\:N | Many disciplines can be coached by many coaches. |

  
## 🔐 User Roles

- `admin`: full access to all tables.
- `news_agent`: read-only access to the `results` table.
- `lawyer`: read-only access to the `athlete_passports` table.

##  SQL View

```sql
CREATE VIEW top_athletes AS
SELECT a.athlete_id,
       a.competitor,
       a.nationality,
       COUNT(r.result_id) AS total_results,
       AVG(r.result_score) AS avg_score
FROM results r
JOIN athletes a ON r.athlete_id = a.athlete_id
GROUP BY a.athlete_id, a.competitor, a.nationality
ORDER BY avg_score DESC
LIMIT 10;
