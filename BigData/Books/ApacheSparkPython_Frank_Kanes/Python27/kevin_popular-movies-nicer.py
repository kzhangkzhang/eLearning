from pyspark import SparkConf, SparkContext

def loadMovieNames():
    movieNames = {}
    with open("ml-100k/u.ITEM") as f:
        for line in f:
            fields = line.split('|')
            movieNames[int(fields[0])] = fields[1]
    return movieNames

conf = SparkConf().setMaster("local").setAppName("PopularMovies")
sc = SparkContext(conf = conf)

nameDict = sc.broadcast(loadMovieNames())

lines = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/ml-100k/u.data")
movies = lines.map(lambda x: (int(x.split()[1]), 1))
movieCounts = movies.reduceByKey(lambda x, y: x + y)

#flipped = movieCounts.map(lambda (x, y) : (y,x))         # book version: this doesn't work ... syntax error
flipped = movieCounts.map(lambda x : (x[1], x[0]))       # this is different fromn book
sortedMovies = flipped.sortByKey()

# sortedMoviesWithNames = sortedMovies.map(lambda (count, movie) : (nameDict.value[movie], count)) # book version: doesn't work
sortedMoviesWithNames = sortedMovies.map(lambda movieData: (nameDict.value[movieData[1]], movieData[0]))

results = sortedMoviesWithNames.collect()

for result in results:
    print(result)
