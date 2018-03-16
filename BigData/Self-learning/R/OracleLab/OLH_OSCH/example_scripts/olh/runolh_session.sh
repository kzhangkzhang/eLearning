hadoop fs -rm -r temp_out_session

hadoop jar ${OLH_HOME}/jlib/oraloader.jar \
       oracle.hadoop.loader.OraLoader \
       -conf /home/oracle/movie/moviework/olh/moviesession.xml \
       -D mapred.reduce.tasks=2
