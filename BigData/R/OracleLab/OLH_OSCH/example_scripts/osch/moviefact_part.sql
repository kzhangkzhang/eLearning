
SET ECHO ON

DROP TABLE movie_fact_db_tab;

CREATE TABLE movie_fact_db_tab
    (
      CUST_ID  NUMBER,
      MOVIE_ID NUMBER,
      GENRE_ID NUMBER,
      TIME_ID DATE,
      RECOMMENDED NUMBER,
      ACTIVITY_ID NUMBER,
      RATING      NUMBER,
      SALES       NUMBER
    )
    PARTITION BY RANGE(TIME_ID)(
PARTITION y2010 VALUES LESS THAN (TO_DATE('01-JAN-2011','DD-MON-YYYY')),
PARTITION y2011 VALUES LESS THAN (TO_DATE('01-JAN-2012','DD-MON-YYYY')),
PARTITION y2012 VALUES LESS THAN (TO_DATE('01-JAN-2013','DD-MON-YYYY')));

SET ECHO OFF