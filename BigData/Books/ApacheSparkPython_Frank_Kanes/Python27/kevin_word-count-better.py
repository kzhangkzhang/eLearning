################################################################################
# File      : kevin_word-count-better.py
# Desc      : count the word in a text file
#
# Change History
# ==============================================================================
# Date          Who          Change
# 06-NOV-2017   Kevin Zhang  initial creation
#
################################################################################
import re    # regular expression
from pyspark import SparkConf, SparkContext

def normalizeWords(text):
    return re.compile(r'\W+', re.UNICODE).split(text.lower())

conf = SparkConf().setMaster("local").setAppName("Kevin_WordCountBetter")
sc = SparkContext(conf = conf)

# input: pyspark.rdd.RDD
input = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/book.txt")

# words: pyspark.rdd.PipelinedRDD
# all the word will be in lowercase
words = input.flatMap(normalizeWords)

# wordCounts: collections.defaultdict
wordCounts = words.countByValue()

for word, count in wordCounts.items():
    cleanWord = word.encode('ascii', 'ignore')
    if (cleanWord):
        print(cleanWord.decode() + " " + str(count))
