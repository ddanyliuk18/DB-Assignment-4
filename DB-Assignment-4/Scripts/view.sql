USE assignment4;

CREATE VIEW top_athletes AS
SELECT a.athlete_id,
    a.competitor,
    a.nationality,
    COUNT(r.result_id) AS total_results,
    AVG(r.result_score) AS avg_score
FROM results r
JOIN athlets ON r.athlete_id = a.athlete_id
GROUP BY a.athlete_id, a.competitor, a.nationality
ORDER BY avg_score DESC
LIMIT 10;