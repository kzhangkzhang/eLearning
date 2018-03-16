# Add HIVE_HOME/lib* to HADOOP_CLASSPATH.  This is not preset 
# in the VM since this breaks Pig in the previous lab.

export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HIVE_HOME/lib/*

hadoop jar $OSCH_HOME/jlib/orahdfs.jar \
       oracle.hadoop.exttab.ExternalTable \
       -conf /home/oracle/movie/moviework/osch/tuning/moviefact_hivepartb.xml \
       -createTable
