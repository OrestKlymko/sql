SELECT
  PROJECT.ID AS PROJECT_ID,
  (SUM(WORKER.SALARY) * DATEDIFF(month, PROJECT.START_DATE, PROJECT.FINISH_DATE)) AS PRICE
FROM
  PROJECT_WORKER
JOIN
  WORKER ON WORKER.ID = PROJECT_WORKER.WORKER_ID
JOIN
  PROJECT ON PROJECT.ID = PROJECT_WORKER.PROJECT_ID
GROUP BY
  PROJECT.ID
ORDER BY
  PRICE DESC