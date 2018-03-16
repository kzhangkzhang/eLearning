################################################################################
# File      : kevin_word-count.py
# Desc      : count the word in a text file
#
# Change History
# ==============================================================================
# Date          Who          Change
# 06-NOV-2017   Kevin Zhang  initial creation
#
################################################################################

from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("WordCount")
sc = SparkContext(conf = conf)

# input: pyspark.rdd.RDD
input = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/Python27/book.txt")

# words: pyspark.rdd.PipelinedRDD
words = input.flatMap(lambda x: x.split())

# wordCounts: collections.defaultdict
wordCounts = words.countByValue()

for word, count in wordCounts.items():
    cleanWord = word.encode('ascii', 'ignore')
    if (cleanWord):
        print(cleanWord.decode() + " " + str(count))
