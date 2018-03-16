set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

create external table moviedemo.movieapp_log_stage_part(
                         custid  int,
                         movieid int,
                         genreid int,
                         time    string,
                         recommended int,
                         rating      int,
                         sales       float)
               partitioned by (activity int)
               row format delimited
               fields terminated by '\t';

from moviedemo.movieapp_log_stage s
   insert overwrite table moviedemo.movieapp_log_stage_part partition(activity)
   select s.custid, s.movieid, s.genreid, s.time, s.recommended, s.rating, s.sales, s.activity where s.activity is not null;


