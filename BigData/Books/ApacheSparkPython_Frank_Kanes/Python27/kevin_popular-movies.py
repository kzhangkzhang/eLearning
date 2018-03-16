from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("PopularMovies")
sc = SparkContext(conf = conf)

lines = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/ml-100k/u.data")
movies = lines.map(lambda x: (int(x.split()[1]), 1))
movieCounts = movies.reduceByKey(lambda x, y: x + y)

#flipped = movieCounts.map(lambda (x, y) : (y,x))         # book version: this doesn't work ... syntax error
flipped = movieCounts.map(lambda x : (x[1], x[0]))       # this is different fromn book
sortedMovies = flipped.sortByKey()

results = sortedMovies.collect()

for result in results:
    print(result)
