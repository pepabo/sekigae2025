-- cat main.sql | bq query --nouse_legacy_sql --parameter="members:string:zipper takutaka drumato ressy shibatch masaki chiroru ryu-ch kmsn"

WITH members AS (
    SELECT name
      FROM UNNEST(SPLIT(@members, ' ')) AS name
  ORDER BY rand()
)
SELECT ROW_NUMBER() OVER() AS num,
       *
  FROM members
