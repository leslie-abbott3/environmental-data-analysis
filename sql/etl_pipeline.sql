-- Aggregates raw sensor readings into daily averages
CREATE TABLE IF NOT EXISTS daily_data AS
SELECT 
    sensor_id,
    DATE(timestamp) AS day,
    AVG(reading) AS avg_value,
    MIN(reading) AS min_value,
    MAX(reading) AS max_value
FROM raw_data
GROUP BY sensor_id, day;
