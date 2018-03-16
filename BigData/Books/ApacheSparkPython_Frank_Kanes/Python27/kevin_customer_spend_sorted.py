################################################################################
# File      : kevin_customer_spend_sorted.py
# Desc      : home page (page 117 of the book)
#
# Change History
# ==============================================================================
# Date          Who          Change
# 06-NOV-2017   Kevin Zhang  initial creation
#
################################################################################
from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("KevinCustomerSpend")
sc = SparkContext(conf = conf)

def parseLine(line):
    # split line by comma delimter
    fields = line.split(',')    
    custId     = int(fields[0])
    custSpend  = float(fields[2])
    
    return(custId, custSpend)
    
input = sc.textFile("file:///F:/Working@Knowles/Oracle/Development/BigData/KevinPractice/Books/ApacheSparkPython_Frank_Kanes/customer-orders.csv")

parseLines = input.map(parseLine)

custSpends = parseLines.reduceByKey(lambda x,y: x + y)

custSpendsSorted = custSpends.map(lambda x: (x[1], x[0])).sortByKey()

#print out result
results = custSpendsSorted.collect()

for eachDetail in results:
#    print("Customer ID: " + str(eachCust[1]) + " total spend = " + str(eachCust[0]))
    print("cust id {0} has spent {1}".format(eachDetail[1], eachDetail[0]))
