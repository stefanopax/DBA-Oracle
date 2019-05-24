SELECT trunc((100 - sum(percent_space_used)) + sum(percent_space_reclaimable))
FROM v$flash_recovery_area_usage;
