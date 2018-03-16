# reference: F:\Working@Knowles\Oracle\Development\BigData\KevinPractice\Udemy\JoseP_GoFromZerotoHeroinPython\Complete-Python-Bootcamp\Kevin_Object_Oriented_Programming.ipynb
class Circle(object):

	# class object attributes
	pi = 3.1415926

	# Circle get instantiated with a radius (default is 1)
	def __init__(self, radius=1):
		self.radius = radius

	# Area method calucates the area. NOte the use of the self
	def area(self):
		'''
		This method will calcuate area for a Circle using radius of circle object
		'''

		# pi * radius**2
		return Circle.pi * self.radius * self.radius

	# Method to resetting Radius
	def setRadius(self, radius):
		'''
		This method takes in a radius, and resets the current radius of the Circle object
		'''
		self.radius = radius

	# Method for getting radius (same as calling .radius)
	def getRadius(self):
		return self.radius

################### Test script #########################
print Circle.pi

c1 = Circle(radius = 1000)
print "The area of c1 =", c1.area()


####################### Learn Inheritance ###############################

# define base class Animal
class Animal(object):
	def __init__(self):
		print "An animal is created"

	def whoAmI(self):
		print "I am an animal"

	def eat(self):
		print "I am eating"

# define derived class Dog, here we are passing base class 'Animal' as argument for class Dog
class Dog(Animal):
	def __init__(self):
		Animal.__init__(self)
		print "Dog is created"

	def whoAmI(self):
		print "I am a dog"

	def bark(self):
		print "Woof! Woof!"

##################### Test Script ##########################
a = Animal()
a.whoAmI()

d1 = Dog()
d1.whoAmI()

d1.eat()
d1.bark()

####################### Learn Special Methods ###############################
class Book(object):
	def __init__(self, title, author, pages):
		print "a book is created"
		self.title = title
		self.author = author
		self.pages = pages

	def __str__(self):
		return "Title: %s \nAuthor: %s \nPages: %s\n" %(self.title, self.author, self.pages)

	def __len__(self):
		return self.pages

	def __del__(self):
		print "Book - Title: %s Author: %s Pages: %s is deleted" %(self.title, self.author, self.pages)


###################### Test Script ##########################
b1 = Book(title = "Learning Python", author = 'Kevin', pages = 2000)		
print b1
print "Book %s has %i pages" %(b1.title, len(b1))
