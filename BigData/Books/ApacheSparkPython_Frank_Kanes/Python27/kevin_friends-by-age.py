################################################################################
# File      : kevin_friends-by-age.py
# Desc      : count the word in a text file
#
# Change History
# ==============================================================================
# Date          Who          Change
# 06-NOV-2017   Kevin Zhang  initial creation
#
################################################################################
from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("KevinFriendsByAge")
sc = SparkContext(conf = conf)

def parseLine(line):
    fields = line.split(',')
    age = int(fields[2])
    numFriends = int(fields[3])
    return (age, numFriends)

lines = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/fakefriends.csv")
rdd = lines.map(parseLine)
totalsByAge = rdd.mapValues(lambda x: (x, 1)).reduceByKey(lambda x, y: (x[0] + y[0], x[1] + y[1]))
averagesByAge = totalsByAge.mapValues(lambda x: x[0] / x[1])
results = averagesByAge.collect()
for result in results:
    print(result)
