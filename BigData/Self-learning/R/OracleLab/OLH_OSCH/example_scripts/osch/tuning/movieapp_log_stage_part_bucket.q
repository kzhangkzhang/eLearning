set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.enforce.bucketing=true;

create external table moviedemo.movieapp_log_stage_part_b(
                   custid  int,
                   movieid int,
                   genreid int,
                   time    string,
                   recommended int,
                   activity    int,
                   rating      int,
                   sales       float)
         clustered by (custid) into 8 buckets
         row format delimited
         fields terminated by '\t';

from moviedemo.movieapp_log_stage s
     insert overwrite table moviedemo.movieapp_log_stage_part_b 
     select s.custid, s.movieid, s.genreid, s.time, s.recommended, s.activity, s.rating, s.sales;

