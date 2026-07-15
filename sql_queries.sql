-- ============================================================
-- Football Match Analysis SQL Queries
-- ============================================================
-- This file contains analytical SQL queries for examining:
-- 1. Yearly win rates by team
-- 2. Wins by team and tournament
-- 3. Home and away wins by team
-- 4. Match outcomes grouped by goal difference
-- ============================================================

-- ============================================================
-- 1. Yearly Win Rates by Team
-- ============================================================

WITH team_match_results AS (
SELECT
d.year,
ht.team_name AS team,
CASE
WHEN f.home_win = 1 THEN 1
ELSE 0
END AS win_flag
FROM fact_match_result AS f
INNER JOIN dim_date AS d
ON f.date_key = d.date_key
INNER JOIN dim_team AS ht
ON f.home_team_key = ht.team_key

```
UNION ALL

SELECT
    d.year,
    at.team_name AS team,
    CASE
        WHEN f.away_win = 1 THEN 1
        ELSE 0
    END AS win_flag
FROM fact_match_result AS f
INNER JOIN dim_date AS d
    ON f.date_key = d.date_key
INNER JOIN dim_team AS at
    ON f.away_team_key = at.team_key
```

)

SELECT
year,
team,
COUNT(*) AS matches_played,
SUM(win_flag) AS wins,
ROUND(SUM(win_flag) * 1.0 / COUNT(*), 3) AS win_rate
FROM team_match_results
GROUP BY
year,
team
HAVING COUNT(*) > 0
ORDER BY
team,
year;

-- ============================================================
-- 2. Wins by Team and Tournament
-- ============================================================

WITH team_tournament_wins AS (
SELECT
t.tournament_name,
ht.team_name AS team,
CASE
WHEN f.home_win = 1 THEN 1
ELSE 0
END AS win_flag
FROM fact_match_result AS f
INNER JOIN dim_tournament AS t
ON f.tournament_key = t.tournament_key
INNER JOIN dim_team AS ht
ON f.home_team_key = ht.team_key

```
UNION ALL

SELECT
    t.tournament_name,
    at.team_name AS team,
    CASE
        WHEN f.away_win = 1 THEN 1
        ELSE 0
    END AS win_flag
FROM fact_match_result AS f
INNER JOIN dim_tournament AS t
    ON f.tournament_key = t.tournament_key
INNER JOIN dim_team AS at
    ON f.away_team_key = at.team_key
```

)

SELECT
tournament_name,
team,
SUM(win_flag) AS wins
FROM team_tournament_wins
GROUP BY
tournament_name,
team
HAVING SUM(win_flag) > 0
ORDER BY
tournament_name,
wins DESC,
team;

-- ============================================================
-- 3. Home and Away Wins by Team
-- ============================================================

WITH home_away_wins AS (
SELECT
ht.team_name AS team,
'Home' AS venue_type,
COUNT(*) AS wins
FROM fact_match_result AS f
INNER JOIN dim_team AS ht
ON f.home_team_key = ht.team_key
WHERE f.home_win = 1
GROUP BY ht.team_name

```
UNION ALL

SELECT
    at.team_name AS team,
    'Away' AS venue_type,
    COUNT(*) AS wins
FROM fact_match_result AS f
INNER JOIN dim_team AS at
    ON f.away_team_key = at.team_key
WHERE f.away_win = 1
GROUP BY at.team_name
```

)

SELECT
team,
venue_type,
wins
FROM home_away_wins
ORDER BY
team,
venue_type;

-- ============================================================
-- 4. Matches Grouped by Goal Difference and Outcome
-- ============================================================

SELECT
FLOOR(goal_diff / 2.0) * 2 AS goal_diff_bin,
CASE
WHEN draw = 1 THEN 'Draw'
WHEN home_win = 1 THEN 'Home Win'
WHEN away_win = 1 THEN 'Away Win'
ELSE 'Unknown'
END AS match_outcome,
COUNT(*) AS match_count
FROM fact_match_result
GROUP BY
FLOOR(goal_diff / 2.0) * 2,
CASE
WHEN draw = 1 THEN 'Draw'
WHEN home_win = 1 THEN 'Home Win'
WHEN away_win = 1 THEN 'Away Win'
ELSE 'Unknown'
END
ORDER BY
goal_diff_bin,
match_outcome;

