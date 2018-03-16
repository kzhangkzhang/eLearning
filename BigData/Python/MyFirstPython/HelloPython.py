import random
import sys
import os

print("hello world")

# sigle-line Comment

'''
multiple lines commant
'''

name = "Kevin Zhang"
print(name)

'''
# five main types in Python: 
- numbers
- Strings
- Lists
- Tuples
- Dictionaries
'''

##################################################################
# NUMBERS
##################################################################
print("5 + 2 = ", 5+2)
print("5 - 2 = ", 5 - 2)
print("5 * 2 = ", 5 * 2)
print("5 / 2 = ", 5 / 2)
print("5 % 2 = ", 5 % 2)
print("5 ** 2 = ", 5 ** 2)
print("5 // 2 = ", 5 // 2)

##################################################################
# STRINGS
##################################################################
quote = "\"Always remeber you are unique"

multi_line_quote = ''' just
like everyone else '''

print("%s %s %s" % ('I like the quote', quote, multi_line_quote))

print ("I don't like ", end="")
print("newlines")

#print 5 blank lines
print('\n' * 5)

##################################################################
# LISTS: index starts with 0
##################################################################
grocery_list = ['juice', 'Tomatoes', 'Potatoes',
                'Bananas', 'Apple']

print('First item:', grocery_list[0])

#change first item to something else
grocery_list[0] = 'pineapple'
print('First item is changed to: ', grocery_list[0])

# print a subsset from list ... it will not include ending index object (3 in below)
print("Let's print 2nd and third items: ", end="")
print(grocery_list[1:3])

#####################################################################
# For Loop
#####################################################################
expenses = [2340, 2500, 2100, 3100, 2980]

total_expenses = 0

for item in expenses:
    total_expenses = total_expenses + item

print("total expense = ", total_expenses)
print('============================================================\n')

total_expenses = 0
for i in range(len(expenses)):
    print('Month:', (i+1), 'Expense:', expenses[i])
    total_expenses = total_expenses + expenses[i]

print("new total expense = ", total_expenses)

for i in range(1, 11, 2):
    print(i)
    print("%s * %s =" %(i, i), i*i)

print('======================break in for loop ======================================\n')
key_location = "chair"

locations=["garage", "living room", "chair", "closet"]

for i in locations:
    if i == key_location:
        print("key is found in", i)
        break
    else:
        print("Key is NOT found in", i)

print('=================== continue in for loop =============================\n')
for i in range(1,6):
    if i%2 == 0:
        continue
    print(i*i)

print('=================== while loop =========================================\n')
i = 1
while i < 10:
    print("i is", i)
    i = i + 1

print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
print('+++++++++++++++++++++++++         FUNCTION      +++++++++++++++++++++++++++')
print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
def calc_total(exp):
    total = 0

    for item in exp:
        total = total + item

    return total

kevin_exp_list = [1000, 2000, 6000, 8000]
ying_exp_list = [4000, 8000, 900000]

kevin_total = calc_total(kevin_exp_list)
ying_total = calc_total(ying_exp_list)

print("Kevin expense: ", kevin_total)
print("Ying expense:", ying_total)

def mysum(a, b=0):
    """
    This function takes 2 auguments which are interger numbers and it will return sum
    """
    return a + b

print ("5 + 6 =", mysum(5,6))

# named argument
print ("15 +16 =", mysum(b=15,a=16))

# I am not passing 2nd argument ... 
print(mysum(10))