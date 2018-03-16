from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("KevinPopularHero")
sc = SparkContext(conf = conf)

def countCoOccurences(line):
    elements = line.split()
    return (int(elements[0]), len(elements) - 1)

def parseNames(line):
    fields = line.split('\"')
    return (int(fields[0]), fields[1].encode("utf8"))

names = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/marvel-names.txt")
namesRdd = names.map(parseNames)

lines = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/marvel-graph.txt")

pairings = lines.map(countCoOccurences)
totalFriendsByCharacter = pairings.reduceByKey(lambda x, y : x + y)
#flipped = totalFriendsByCharacter.map(lambda (x,y) : (y,x)) # book version doesn't work
flipped = totalFriendsByCharacter.map(lambda data: (data[1], data[0]))

# flipped: pyspark.rdd.PipelinedRDD
# mostPopular: tuple
mostPopular = flipped.max()

# namesRdd.lookup(mostPopular[1]): is a list
mostPopularName = namesRdd.lookup(mostPopular[1])[0]

print(mostPopularName + " is the most popular superhero, with " + \
    str(mostPopular[0]) + " co-appearances.")
