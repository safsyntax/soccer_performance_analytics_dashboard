SQL Queries 

Yearly win rates by team 

WITH team_match_results AS ( 

    SELECT 

        d.year, 

        ht.team_name AS team, 

        CASE  

            WHEN f.home_win = 1 THEN 1 

            ELSE 0 

        END AS win_flag 

    FROM fact_match_result f 

    JOIN dim_date d 

        ON f.date_key = d.date_key 

    JOIN dim_team ht 

        ON f.home_team_key = ht.team_key 

 

    UNION ALL 

 

    SELECT 

        d.year, 

        at.team_name AS team, 

        CASE  

            WHEN f.away_win = 1 THEN 1 

            ELSE 0 

        END AS win_flag 

    FROM fact_match_result f 

    JOIN dim_date d 

        ON f.date_key = d.date_key 

    JOIN dim_team at 

        ON f.away_team_key = at.team_key 

) 

 

SELECT 

    year, 

    team, 

    COUNT(*) AS matches_played, 

    SUM(win_flag) AS wins, 

    ROUND(SUM(win_flag) * 1.0 / COUNT(*), 3) AS win_rate 

FROM team_match_results 

GROUP BY year, team 

HAVING COUNT(*) > 0 

ORDER BY team, year; 

 

Wins by team and tournament 

 

WITH team_tournament_wins AS ( 

    SELECT 

        t.tournament_name, 

        ht.team_name AS team, 

        CASE  

            WHEN f.home_win = 1 THEN 1 

            ELSE 0 

        END AS win_flag 

    FROM fact_match_result f 

    JOIN dim_tournament t 

        ON f.tournament_key = t.tournament_key 

    JOIN dim_team ht 

        ON f.home_team_key = ht.team_key 

 

    UNION ALL 

 

    SELECT 

        t.tournament_name, 

        at.team_name AS team, 

        CASE  

            WHEN f.away_win = 1 THEN 1 

            ELSE 0 

        END AS win_flag 

    FROM fact_match_result f 

    JOIN dim_tournament t 

        ON f.tournament_key = t.tournament_key 

    JOIN dim_team at 

        ON f.away_team_key = at.team_key 

) 

 

SELECT 

    tournament_name, 

    team, 

    SUM(win_flag) AS wins 

FROM team_tournament_wins 

GROUP BY tournament_name, team 

HAVING SUM(win_flag) > 0 

ORDER BY tournament_name, wins DESC, team; 

 

 

Counts of Home and Away Wins for each team 

WITH home_away_wins AS ( 

    SELECT 

        ht.team_name AS team, 

        'Home' AS venue_type, 

        COUNT(*) AS wins 

    FROM fact_match_result f 

    JOIN dim_team ht 

        ON f.home_team_key = ht.team_key 

    WHERE f.home_win = 1 

    GROUP BY ht.team_name 

 

    UNION ALL 

 

    SELECT 

        at.team_name AS team, 

        'Away' AS venue_type, 

        COUNT(*) AS wins 

    FROM fact_match_result f 

    JOIN dim_team at 

        ON f.away_team_key = at.team_key 

    WHERE f.away_win = 1 

    GROUP BY at.team_name 

) 

 

SELECT 

    team, 

    venue_type, 

    wins 

FROM home_away_wins 

ORDER BY team, venue_type; 

 

 

Grouping matches by goal difference and outcome 

SELECT 

    FLOOR(goal_diff / 2.0) * 2 AS goal_diff_bin, 

    CASE 

        WHEN draw = 1 THEN 'Draw' 

        WHEN home_win = 1 THEN 'Home Win' 

        WHEN away_win = 1 THEN 'Away Win' 

    END AS match_outcome, 

    COUNT(*) AS match_count 

FROM fact_match_result 

GROUP BY 

    FLOOR(goal_diff / 2.0) * 2, 

    CASE 

        WHEN draw = 1 THEN 'Draw' 

        WHEN home_win = 1 THEN 'Home Win' 

        WHEN away_win = 1 THEN 'Away Win' 

    END 

ORDER BY goal_diff_bin, match_outcome; 
