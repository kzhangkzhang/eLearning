hadoop fs -rm -r movie_apache_log_dir
hadoop fs -mkdir movie_apache_log_dir
hadoop fs -put reg_exp.dat movie_apache_log_dir

hadoop fs -rm -r temp_out_session_re

hadoop jar ${OLH_HOME}/jlib/oraloader.jar \
       oracle.hadoop.loader.OraLoader \
       -conf /home/oracle/movie/moviework/olh/reg_exp.xml \
       -D mapreduce.job.reduces=4
