SELECT
  t5.street,
  t5.key
FROM (
  SELECT
    t4.street,
    (
      row_number() OVER (ORDER BY t4.street) - 1
    ) AS key
  FROM (
    SELECT
      t1.street,
      t1.key
    FROM (
      SELECT
        t0.*,
        (
          row_number() OVER (ORDER BY t0.street) - 1
        ) AS key
      FROM data AS t0
    ) AS t1
    INNER JOIN (
      SELECT
        t1.key
      FROM (
        SELECT
          t0.*,
          (
            row_number() OVER (ORDER BY t0.street) - 1
          ) AS key
        FROM data AS t0
      ) AS t1
    ) AS t2
      ON t1.key = t2.key
  ) AS t4
) AS t5
INNER JOIN (
  SELECT
    t5.key
  FROM (
    SELECT
      t4.street,
      (
        row_number() OVER (ORDER BY t4.street) - 1
      ) AS key
    FROM (
      SELECT
        t1.street,
        t1.key
      FROM (
        SELECT
          t0.*,
          (
            row_number() OVER (ORDER BY t0.street) - 1
          ) AS key
        FROM data AS t0
      ) AS t1
      INNER JOIN (
        SELECT
          t1.key
        FROM (
          SELECT
            t0.*,
            (
              row_number() OVER (ORDER BY t0.street) - 1
            ) AS key
          FROM data AS t0
        ) AS t1
      ) AS t2
        ON t1.key = t2.key
    ) AS t4
  ) AS t5
) AS t6
  ON t5.key = t6.key