CREATE OR REPLACE TABLE log_raw.game_logs (
    RAW_LOG JSON,
    INGESTED_AT TIMESTAMP
)
;
INSERT INTO log_raw.game_logs (RAW_LOG, INGESTED_AT)
SELECT * , current_timestamp
FROM read_json_objects('data/logs/logs_2/*.json')
;

