from pyspark import SparkConf, SparkContext
import collections

conf = SparkConf().setMaster("local").setAppName("KevinRatingsHistogram")
sc = SparkContext(conf = conf)

'''
Sample lines from u.data
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
'''

# read content from file and create a RDD object (lines)
# lines is pyspark.rdd.RDD object
lines = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/ml-100k/u.data")

# for each line (e.g 196	242	3	881250949) split line into a list using space as separator
# then get the 3rd item (index = 2) from the list, which is the rate value
# ratings is a pyspark.rdd.PipelinedRDD object
ratings = lines.map(lambda x: x.split()[2])

# countByValue() is function of RDD: it will Return the count of each unique value in this RDD as a dictionary of (value, count) pairs.
# result is a collections.defaultdict object
# the value of result looks like: defaultdict(<class 'int'>, {'4': 34174, '1': 6110, '5': 21201, '3': 27145, '2': 11370})
#
result = ratings.countByValue()

# result.items() looks like: dict_items([('4', 34174), ('1', 6110), ('5', 21201), ('3', 27145), ('2', 11370)])
# result.items() is a dict_items object
# sortedResults looks like: OrderedDict([('1', 6110), ('2', 11370), ('3', 27145), ('4', 34174), ('5', 21201)])
sortedResults = collections.OrderedDict(sorted(result.items()))


for key, value in sortedResults.items():
    print("%s %i" % (key, value))
