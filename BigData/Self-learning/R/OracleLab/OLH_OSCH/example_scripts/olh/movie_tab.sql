SET ECHO ON

-- drop table if leftover from previous labs
DROP TABLE MOVIE_LOCAL_TAB;

CREATE TABLE MOVIE_LOCAL_TAB
(
      "CUSTID" 		    NUMBER,
      "MOVIEID"             NUMBER,
      "GENREID"             NUMBER,
      "TIME"                DATE,
      "RECOMMENDED"         NUMBER,
      "RATING"    	    NUMBER,
      "ACTIVITY"            NUMBER,
      "SALES"               NUMBER
)
PARTITION BY HASH(ACTIVITY);

SET ECHO OFF
