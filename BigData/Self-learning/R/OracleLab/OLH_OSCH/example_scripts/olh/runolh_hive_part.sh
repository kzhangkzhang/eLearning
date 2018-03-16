# Add HIVE_HOME/lib* to HADOOP_CLASSAPTH.   This is not preset
# in the VM since this breaks Pig in the previous lab.

export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HIVE_HOME/lib/*

hadoop fs -rm -r temp_out_session_p

hadoop jar ${OLH_HOME}/jlib/oraloader.jar \
       oracle.hadoop.loader.OraLoader \
       -conf /home/oracle/movie/moviework/olh/olh_hive_part.xml \
       -libjars /usr/lib/hive/lib/hive-exec.jar,/usr/lib/hive/lib/hive-metastore.jar,/usr/lib/hive/lib/libfb303-0.9.0.jar \
       -D mapreduce.job.reduces=4 \
       -D oracle.hadoop.loader.input.hive.partitionFilter='activity < 4'
