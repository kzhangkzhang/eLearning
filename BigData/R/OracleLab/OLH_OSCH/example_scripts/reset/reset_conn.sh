
# clean up HDFS directories used by Oracle Loader for Hadoop in 
# previous lab runs

hdfs dfs -rm -r temp_out_session
hdfs dfs -rm -r temp_out_session_p
hdfs dfs -rm -r temp_out_session_re
hdfs dfs -rm moviework/data/part-00005

hdfs dfs -rm -r movie_apache_log_dir
hdfs dfs -mkdir movie_apache_log_dir
hdfs dfs -put /home/oracle/movie/moviework/olh/reg_exp.data movie_apache_log_dir

# clean up files from previous lab runs

rm /home/oracle/movie/moviework/osch/osch*

rm /home/oracle/movie/moviework/osch/*log
rm /home/oracle/movie/moviework/osch/*bad
rm /home/oracle/movie/moviework/olh/*log

sqlplus moviedemo@orcl/welcome1 <<ENDOFSQL

drop directory MOVIEWORKSHOP_DIR;
drop table MOVIE_FACT_DB_TAB;
drop table MOVIE_SESSIONS_TAB;
drop table MOVIE_FACT_EXT_TAB_HIVE;
drop table MOVIE_FACT_EXT_TAB_TEXT;
drop table MOVIE_FACT_HIVE_B;
drop table MOVIE_FACT_LOCAL;
drop table MOVIE_LOCAL_TAB;
drop table MOVIE_APACHE_COMBINED_LOG;  
drop view MOVIE_FACT_HIVEPART_UNIONALL;

@/home/oracle/movie/moviework/olh/movie_tab.sql
@/home/oracle/movie/moviework/olh/moviesession.sql
@/home/oracle/movie/moviework/olh/reg_exp.sql

create or replace directory MOVIEWORKSHOP_DIR as '/home/oracle/movie/moviework/osch';

create or replace directory OSCH_BIN_PATH as '/u01/connectors/osch/bin';

exit;
ENDOFSQL

sh /home/oracle/movie/moviework/osch/drop_moviefact_hivepart.sh
sh /home/oracle/movie/moviework/osch/tuning/drop_moviefact_hivepartb.sh

export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HIVE_HOME/lib/*

hive -e "drop table moviedemo.movieapp_log_stage_1;"
hive -e "create table moviedemo.movieapp_log_stage_1 as select * from moviedemo.movieapp_log_stage where activity = 1;"
hive -e "drop table moviedemo.movieapp_log_stage_part;"
hive -e "drop table moviedemo.movieapp_log_stage_part_b;"
hive -f /home/oracle/movie/moviework/olh/create_movieapp_log_stage_part.q
hive -f /home/oracle/movie/moviework/osch/movieapp_log_stage_part.q
hive -f /home/oracle/movie/moviework/osch/tuning/movieapp_log_stage_part_bucket.q

