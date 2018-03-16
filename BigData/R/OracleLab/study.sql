-- list all objects owned by moviedemo schema
select * from dba_objects
where
1 = 1
and owner = 'MOVIEDEMO'
--and object_name like '%TIME%'
order by created desc;


select * from dba_tables
where table_name like '%ONTIME_S%';



SELECT * FROM moviedemo.ontime_s;
select count(1) from moviedemo.ontime_s;


select * from MOVIEDEMO.ORE$8_148;

select * from MOVIEDEMO.KEVIN_TABLE1;

select count(1) from moviedemo.ontime_s;