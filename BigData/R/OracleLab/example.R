
# version of R
version

#session info
sessionInfo()

# today's date
Sys.Date()

# list all available packages in your local R session
myLocalPackages <- row.names(installed.packages())
myLocalPackages


# Oracle Learning Library: https://apexapps.oracle.com/pls/apex/f?p=44785:24:2415799518873:::24:P24_CONTENT_ID,P24_PREV_PAGE:8984,24

# base is 10
log10(1000)
# base is 2
log2(8)
#base is natural number ~ 2.718
log(2.718)

# Listing variables
ls()
objects()


########################################
# vector
########################################
b <- seq(1, 9, by=2)

# replicate: replicate "1" 4 times ... "2" 3 items ... "3" 6 times .. "4" 1 time
(c <- rep(1:4, c(4, 3, 6, 1)))

# vector + vector
v1 <- c(1,3,5)
v2 <- c(2,5,9)
v3 <- (v1 + v2)
v3[0] # return type of vectors
v3[5] # return NA 

# logical vectors
lv1 <- c(TRUE, FALSE, TRUE, FALSE)
lv2 <- c(TRUE, TRUE, FALSE, FALSE)
(lv1 & lv2) # logical AND
(lv1 | lv2) # logical OR

x <- c(1, 2, 4, 9, 13, 20)
x < 5
x[x<10] # print those components whose value < 10: 1, 2, 4, 9

x[x>4 & x< 15] # 9, 13

########################################
# Factor
########################################
f1 <- c("A", "B", "A", "C", "A", "B") 
as.factor(f1)

########################################
# List: An ordered collection of objects with elements that are often named
########################################
myFamily <- list(
                husband     = "Ke Zhang",
                 wife       = "Ying Wang",
                 no.children= 2,
                 child.names= c("Brandon", "Elena"),
                 child.ages= c(8, 5)
)

myFamily[[1]]   # get first object (husband)
myFamily["husband"] # get husband object .. only work if use = instead of <- in above
myFamily$husband    # get husband object .. only work if use = instead of <- in above


########################################
# Data Frame
########################################
a <- c("Ke", "Ying", "Brandon", "Elena")
b <- c(42, 43, 8, 5)
c <- c("steak", "seafood", "hotdog", "noodle")

(df1 <- data.frame(NAME=a, AGE=b, FAVORITE=c))

colnames(df1) # column names

rownames(df1) # row names

nrow(df1)   # how many rows

ncol(df1) # how many columns

dim(df1)  # rows x columns

length(df1)   # this is a quirk ... length is same as ncol()

names(df1)     # this is a quirk ... names is same as colnames()

df1[1,] # row 1 all columns

df1[, 1] # all rows, column 1

df1[, "AGE"]

df1[, c("AGE","NAME")]    # all rows and only column AGE and NAME

head(df1, 2)  # first 2 rows

tail(df1, 2)  # the last 2 rows

summary(df1)


##########################################################################
# Function
##########################################################################
(X <- rnorm(20))    # generate 20 random numbers

# my own function
myMean <-function(x) {
  sum(x)/length(x) * 1.1
}

myMean(X)

myMean(X) == mean(X)

# String function
a <- "Hello"

substr(a, 2, 4)

b <- c("Hello", "World!")

paste(b[1], ", ", b[2], sep="****")

# write data to a file
cat("2 3 4 7 11 13 17 19", file="export_data_from_R_Example.txt", sep="\n")

# Basic Statistical Functions
a <- c(1,2,5,6,8,10,12,17,24,25)

mean(a)
median(a)
var(a)
sd(a)           # standard deviation
diff(a, lag=2)  # 5-1 6-2 8-5 10-6 ...
scale(a)

# identification functions
class(df1)

str(df1)

# apply function over vetors and arrays

x <- cbind(x1=5, x2=c(6:1, 1:4))

col.sums <- apply(x, 2, sum)

row.sums <- apply(x, 1, sum)

apply(x, 2, mean, trim = .1)

# lapply() function
x <-list(a =1:20,
         beta =exp(-5:5),
         logic = c(TRUE,FALSE,FALSE,TRUE,FALSE,TRUE))

lapply(x,mean)

lapply(x, quantile, probs = 1:3/4)


##########################################################################
# Loading Data
##########################################################################

# Read data from a file
# 0: data is number; "" means data is string
scan(file="export_data_from_R_Example.txt", what=list(x=0, y="", z=0), nlines=3)

# read.csv function
df2 <- read.csv(file="~/Kevin/Learning/R/sample.csv")

##########################################################################
# NA
##########################################################################

is.na(c(1, NA))

x <- c(1:5)
is.na(x) <- c(2,4)


##########################################################################
# R Packages
##########################################################################
library(ggplot2)
a <- 1:10
b <- a^2
qplot(a,b)

ggplot(pressure) + geom_point(aes(x=temperature, y=pressure))

qplot(temperature, pressure, data=pressure)

qplot(temperature, pressure, data=pressure,
      main="Temp vs. pressure",
      geom=c("point", "line"),
      lty=I("dashed"))


##########################################################################
# Working Directory
##########################################################################
# get current workding dir
getwd()
# set working dir
setwd("/home/oracle/Kevin/Learning/R")

myWorkingDir = "/home/oracle/Kevin/Learning/R"
setwd(myWorkingDir)


##########################################################################
# R Session management
##########################################################################
help(options)         # learn about available options
options()             # view current option settings
options("digits")     # get the current value for a session option
options(digits=3)     # set the session option value: num digits to print




# histroy commands
history()             # display last 25 commands
history(10)           # display last 10 commands
history(max.show=Inf) # display all previous commands

#save the workspace to the file .Rdata in the CWD
save.image()

# quit session
quit()
q()

##########################################################################
# Data Visualization
##########################################################################

# scatter plot
pressure              # seeded data frame
class(pressure)

plot(pressure, main="main title", sub="this is sub title", xlab="my temp", ylab="my pressure")  # type="p" default
text(100, 550, "Pressure vs. Temp")

plot(pressure, type="l")  # l: line
plot(pressure, type="b")  # b: both line and point
plot(pressure, type="h")  # h: hight

# simple pie chart
paint.sales <- c(0.27, 0.1, 0.14, 0.24, 0.13, 0.07, 0.03)

pie(paint.sales, col = gray(seq(0.5, 1.0, length=7)))

names(paint.sales) <- c("Red", "Green", "Blue", "White", "Brown", "Gray", "Purple")

pie(paint.sales, col = names(paint.sales))

pie(rep(1,12), col=rainbow(12), main="main title", sub="this is sub title")

# histogram
set.seed(25)
x <- rchisq(1000, df=3)

hist(x, freq = FALSE, ylim = c(0, 0.25))

hist(x, freq = FALSE, ylim = c(0, 0.25), main="My New Histogram")

hist(x, 
     freq = FALSE, 
     ylim = c(0, 0.25), 
     main="My New Histogram",
     xlab="Value for X",
     ylab="Value for Y"
     )

curve(dchisq(x, df=3), col = 2, lty = 2, add = TRUE)

legend(8, 0.15, "model distribution", col="red", lty=2)

# boxplot
boxplot(len ~ dose, data = ToothGrowth,
        boxwex = 0.25, at = 1:3 - 0.2,
        subset = supp == "VC", col = "yellow",
        main = "Guinea Pigs' Tooth Growth",
        xlab = "Vitamin C dose mg",
        ylab = "tooth length",
        xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs = "i")

boxplot(len ~ dose, data = ToothGrowth, add = TRUE,
        boxwex = 0.25, at = 1:3 + 0.2,
        subset = supp == "OJ", col = "orange")
legend(2, 9, c("Ascorbic acid", "Orange juice"),
       fill = c("yellow", "orange"))

# perspective graph (Perspective: from Latin: perspicerr "to see through")
example(persp)

# bar plot

example(barplot)

# Smooth Scatter plot
n <- 10000
x1 <- matrix(rnorm(n), ncol=2)
x2 <- matrix(rnorm(n, mean=3, sd=1.5), ncol=2)
x  <- xbind(x1, x2)

oldpar <- par(mfrow=c(2,2))

smoothScatter(x, nrpoints=0)
smoothScatter(x)

# Quality Control Chart (qcc)

#below example doesn't work somehow, I got error: Error in plot.new() : figure margins too large

library(qcc)              # I don't have this package in the VM ... I have install it via RStudio
data(pistonrings)
attach(pistonrings)
head(pistonrings)

diameter <- qcc.groups(diameter, sample)

par(mfrow=c(2,1))
obj <-qcc(diameter[1:25,], type="xbar")

#Pareto Chart
library(qcc)  
defect <- c(80, 27, 66, 94, 33)
names(defect) <- c("price code", "schedule date", "supplier code", "contact num.", "part num.")
pareto.chart(defect)


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ORE Example
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library(ORE)

# list the content of the OREbase package
ls("package:OREbase")

help("OREbase")

head(ls("package:OREbase"), 12)

# get help for the ore virtual class
help("ore-class")

#show the subclasses of the ore virtual class
showClass("ore")

# Get help on the ore.frame class.
help("ore.frame")

# Show the arguments for the aggregate method.
showMethods("aggregate")



x <- stats::runif(12); y <- stats::rnorm(12)
i <- order(x,y); x <- x[i]; y <- y[i];

plot(x,y, main="arrows(.) and segments(.)")     # arrows and segments are ORE functions

## draw arrows from point to point

s <- seq(length(x)-1) # 1 shorter than data
arrows(x[s], y[s], x[s+1], y[s+1], col=1:3)

s <- s[-length(s)]
segments(x[s], y[s], x[s+2], y[s+2], col='pink')

t <- seq(60, 360, 30)
x <- cos(t/180*pi)*t/360
y <- sin(t/180*pi)*t/360

plot(x,y)


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Lesson 5: ORE Transparency Layer
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library(ORE)

# ORE environment settting
options("ore.warn.order")
options("ore.sep")


# connect to Oracle 12c DB in VM as user RQUSER

#ore.connect("RQUSER", "orcl", "localhost", "welcome1", 1521, all=TRUE)

# in my VM, I found ONTIME_S table is available in moviedemo schema instead of rquser schema
# all=TRUE: Use the logical all argument to specify whether Oracle R Enterprise automatically 
# creates an ore.frame object for each table to which the user has access in the schema and 
# makes those ore.frame objects visible in the current R session. The ore.frame objects contain 
# metadata about the tables. The default value of the all argument is FALSE
#
# If all = TRUE, then Oracle R Enterprise implicitly invokes the ore.sync and ore.attach functions. 
# If all = FALSE, then the user must explicitly invoke ore.sync to create ore.frame objects. 
# To access these objects by name, the user must invoke ore.attach to include the names in the search path. 


# *** I created a thread on Oracle R OTN forum https://community.oracle.com/message/14523190#14523190
# the Oracle suppoer lady Sherry send me the email with instruction to create ONTIME (not ONTIME_S) and NARROW table (with data)
# so I have followed the instruction and created these 2 tables (with data) in RQUSER schema in 12c DB of this VM
#

# if you want to use ONTIME from RQUSER in below script, please replace MOVIEDEMO ==> RQUSER and ONTIME_S with ONTIME


ore.connect("MOVIEDEMO", "orcl", "localhost", "welcome1", 1521, all=TRUE)

# list the objects available in the ORE environment mapped to database schema
ore.ls()

ore.ls("MOVIEDEMO")

# all.names=FASE excludes names starting with '.'
ore.ls("MOVIEDEMO", all.names=TRUE)

# list all objects whose name like '%TIME%' (pattern)
ore.ls("MOVIEDEMO", all.names=TRUE, pattern="TIME")

# ore.exists: return TRUE if the named table or view exists in the schema (in the database that is currently connected)
ore.exists("ONTIME_S", "MOVIEDEMO")

ore.exists("XYZ", "MOVIEDEMO")

# create a database table from a data.frame or ore.fram
ore.create(ONTIME_S, table="NEW_ONTIME_S")

# createa view (in database it is a table) from an ore.fram
ore.create(ONTIME_S, table="NEW_ONTIME_S_VIEW")

ore.drop(table="NEW_ONTIME_S")
ore.drop(view="NEW_ONTIME_S_VIEW")
ore.ls("MOVIEDEMO", all.names=TRUE, pattern="TIME") # NEW_ONTIME_S and NEW_ONTIME_S_VIEW should no longer in the list output

# Store R object in database as a **temporary** object, returns handle to object
# In sql developer, connect to 12c DB and you can find this temporary object
# select * from dba_objects where owner = 'MOVIE' order by created desc;  ==> 1st row of query is the object
# the object name like ORE$4_60. You can query this object in 12c: select * from MOVIEDEMO.ORE$4_60;
#
# once your R session ends, this object will be deleted from 12c db automatically
zzzz <- ore.push(c(1,2,3,4,5))

# synchronize ORE proxy objects in R with tables and views available in the database
# When you use the ore.sync function to create an ore.frame object as a proxy for a 
# database table, the name of the ore.frame proxy object is the same as the name of 
# the database object. Each ore.frame proxy object contains metadata about the 
# corresponding database object.
ore.sync(use.keys=FALSE)
ore.sync("MOVIEDEMO")
ore.sync(table=c("ONTIME_S"))

# remove the schema's environment from the object search path (run searchpaths() to list search path)
ore.detach("MOVIEDEMO")

ore.attach()
ore.attach("MOVIEDEMO")
ore.attach("MOVIEDEMO", pos=2)

# list the search paths
searchpaths()


# obtain object handler for a named table or view in the schema
ontime_s_hdl <- ore.get("ONTIME_S", "MOVIEDEMO")
class(ontime_s_hdl)
head(ontime_s_hdl)

# remove table or view from schema's R environment
ore.sync(table=c("CUSTOMER_V", "CUSTOMER_SEGMENT")) # sync it again in case it has been removed previously
ore.attach()
head(CUSTOMER_V)                       # no need quote for object
head(CUSTOMER_SEGMENT)                 # no need quote for object

ore.rm(c("CUSTOMER_V", "CUSTOMER_SEGMENT"))
ore.ls("MOVIEDEMO", all.names=TRUE, pattern="CUSTOMER") # confirm CUSTOMER_V and CUSTOMER_SEGMENT is no longer in the list


# execute SQL/PLSLQ in DB withouta return value
ore.exec("create table KEVIN_TABLE1 as select * from ONTIME_S where rownum < 100")
#ore.sync("MOVIEDEMO", table=c("KEVIN_TABLE1"))
ore.sync(schema = "MOVIEDEMO", table = "KEVIN_TABLE1", use.keys = FALSE)
ore.ls(pattern="KEVIN")
ore.attach("MOVIEDEMO", warn.conflicts=TRUE)

dim(ore.get(name="KEVIN_TABLE1", schema="MOVIEDEMO"))

# or define a handler first; then get the dimension using handler
kevin_hdl <-ore.get(name="KEVIN_TABLE1", schema="MOVIEDEMO")
dim(kevin_hdl)
dim(KEVIN_TABLE1)   # you don't need to quote the object

class(KEVIN_TABLE1)
head(KEVIN_TABLE1)

names(ONTIME_S)
class(ONTIME_S)
dim(ONTIME_S)

# compactly display the structure of an R object ... it is similar like DESCRIBE in SQL*PLUS
str(ONTIME_S)

# drop the table from database after play around with it
ore.drop(table="KEVIN_TABLE1")

# You can create a local R object that contains a copy of data represented by 
# an Oracle R Enterprise proxy object with the ore.pull function
# The ore.pull function takes an ore class object and returns an R object. 
# If the input object is an ore.list, the ore.pull function creates a data.frame 
# and translates each the data of each database column into the appropriate R representation.
df_ontime <- ore.pull(ONTIME_S)
class(df_ontime)
dim(df_ontime)

# Creating a database table from an R data.frame
df_v1 <-data.frame(A=1:26, B=letters[1:26])
dim(df_v1)
class(df_v1)

ore.create(df_v1, table="KEVIN_TABLE2_VIA_R_DATA_FRAME")
ore.ls(pattern="KEVIN_TABLE2_VIA_R_DATA_FRAME")
class(KEVIN_TABLE2_VIA_R_DATA_FRAME)
dim(KEVIN_TABLE2_VIA_R_DATA_FRAME)
head(KEVIN_TABLE2_VIA_R_DATA_FRAME)
ore.drop(table="KEVIN_TABLE2_VIA_R_DATA_FRAME")


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ORE Transparency Layer: Packages and Functions
# - OREbase     : : corresponds to the R base package
# - OREstats    : corresponds to the R stat package
# - OREgraphics : corresponds to the R graphics package
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# access to online documentaiton for ORE packages and functions
OREShowDoc()

demo(package = "ORE")

demo("aggregate", package = "ORE")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# OREbase package
# key sub-packages in this package:
#   - as.ore
#   - ore.vector
#   - ore.character
#   - ore.factor
#   - ore.frame
#   - ore.matrix
#
# *** read Table 1-1 "Mapping Between R, Oracle R Enterprise, and SQL Data Types from
# http://docs.oracle.com/cd/E57012_01/doc.141/e56973/intro.htm#BHCGDIFG
#
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# converting R Type objects to ORE Type Objects: as.ore
#   - as.ore.character
#   - as.ore.numeric
#   - as.ore.vector
#   - as.ore.matrix
#   - as.ore.frame
#   - as.ore


# About the ore.frame Class

# An ore.frame object represents a relational query for an Oracle Database instance. 
# It is the Oracle R Enterprise equivalent of a data.frame. Typically, you get ore.frame 
# objects that are proxies for database tables. You can then add new columns, or make other changes, 
# to the ore.frame proxy object. Any such change does not affect the underlying table. 
# If you then request data from the source table of the ore.frame object, the transparency layer 
# function generates a SQL query that has the additional columns in the select list, 
# but the table is not changed.
#

# example: classes of a data.frame and a corresponding ore.frame
df <- data.frame(a="abc",
                 b=1.456,
                 c=TRUE,
                 d=as.integer(1),
                 e=Sys.Date(),
                 f=as.difftime(c("0:3:20", "11:23:15")))

ore.push(df)
class(df)
class(df$a)
class(df$b)
class(df$c)
class(df$d)
class(df$e)
class(df$f)


df_v2 <-data.frame(A=1:20, B=letters[1:20])
dim(df_v2)
class(df_v2)

# behind scene, an temporary table (e.g. ORE$8_148 will be created in 12c DB under connected schema (e.g. moviedemo)
ore.f2 <- as.ore(df_v2)

class(ore.f2)
dim(ore.f2)
head(ore.f2)

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ore.vector package
#   key functions
#   show                  %in%
#   length                unique
#   c                     ** split
#   is.vector             sort
#   as.vector             rank
#   [                     order
#   head                  ** table
#   tail                  paste
#   l                     interaction
#   compare               ** sapply
#   ==,>,<,!=,<=,>=       tapply
#   is.na                 by
#
#   ** make sure you master these functions
#
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# split() and sapply() function study
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dat <- ONTIME_S[ONTIME_S$ARRDELAY < 100 & ONTIME_S$ARRDELAY > -100,]
ad <- with(dat, split(ARRDELAY, UNIQUECARRIER))

boxplot(ad, col = "blue", notch = TRUE, cex=0.5, varwidth = TRUE)

sapply(ad, length)
sapply(ad, mean, na.rm=TRUE)

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# table() function study
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# the table() function uses the cross-classifying factors to build
# a contingency table of the counts at each combination of factor levels
# The result is an object of type "table"
(t <- table(ONTIME_S$DAYOFWEEK))
class(t)
plot(t)

# in the result, column "0": CANCELLED= 0 (not cancelled); column "1": CANCELLED=1 (cancelled)
table(ONTIME_S$DAYOFWEEK, ONTIME_S$CANCELLED)

# diverted: change flight course
with(ONTIME_S, table(DAYOFWEEK, CANCELLED, DIVERTED))

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ore.character functions
#   nchar     tolower toupper   casefold    chartr  
#   sub       gsub    substr
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# chartr: r: replacement    ==> it is similar to SQL translate() function

x <- ("MiXeD cAsE 123")

chartr("iXs", "why", x)
chartr("a-cX", "D-Fw", x)

version

# Disconnect from the database. Clean up all associated R objects and temporary database schema objects
ore.disconnect()





# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# watch https://www.youtube.com/watch?v=eDrhZb2onWY&t=3805s

# if ... else ....
x <- 3

if(x > 3) {
  print ("x is   greater > 3")
} else if(x==3){
  print ("x = 3")
} else{
  print ("x is < 3")
}

# switch
vtr <- c(100, 200, 300)
option <- "mean"

switch (
  option,
  "mean" = print(mean(vtr)),
  "mode" = print(mode(vtr)),
  "median" = print(median(vtr)),
  print("invalid option")
)


# Data visualization

dept_contribution <- c(14, 28, 11, 30, 17)
dept <- c("IT", "HR", "FINANCE", "SUPPLY CHAIN", "MFG")

#########################################################
# Pie Chart
#########################################################
pie(dept_contribution, dept, col = rainbow(length(dept)))

#########################################################
# Bar Chart
#########################################################
barplot(dept_contribution)

#########################################################
# Boxplot
#########################################################
boxplot(mpg ~ cyl, 
        data = mtcars, 
        xlab = "number of cylinders",
        ylab = "Miles per Gallon",
        main = "Milage Data",
        col = c("Red", "Yellow", "Blue"))
  
#########################################################
# Histogram
#########################################################
hist_data <- c(1, 1, 2, 3, 4,9, 10, 9, 9, 9, 2, 3, 9, 10)
hist(hist_data, col = "red", border = "yellow")

#########################################################
# Line Graph
#########################################################
line_data <- c(1, 1, 2, 3, 4,9, 10, 9, 9, 9, 2, 3, 9, 10)
plot(line_data, type = "o")

#########################################################
# Scatterplot
#########################################################
scat_data1 <- c(10, 10, 20, 30, 40,9, 10, 9, 29, 9, 2, 3, 19, 10)
scat_data2 <- c(1, 1, 2, 3, 4,9, 10, 9, 9, 9, 2, 3, 9, 10)

plot(scat_data1, scat_data2)

