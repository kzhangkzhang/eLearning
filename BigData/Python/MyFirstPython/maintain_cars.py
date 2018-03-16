# source: http://stackabuse.com/python-tutorial-for-absolute-beginners/#liststuplesanddictionaries

# start with an empty list
cars = []

add_inventory = raw_input('Add car inventory? [y/n]: ').lower()

while add_inventory == 'y':
    # get car datails from user
    make    = raw_input('Make   : ')
    model   = raw_input('Model  : ')
    year    = raw_input('Year   : ')
    miles   = raw_input('Miles  : ')

    # Create car dictionary  object and save it to cars list
    car = {'Make'   : make,
           'Model'  : model,
           'Year'   : year,
           'Miles'  : miles}
    cars.append(car)

    # ask user if we should keep going
    add_inventory = raw_input('Add car inventory? [y/n]: ').lower()

print('')
print('Here are your cars list: ')

# Display all of cars
for c in cars:
        print('Make     : ' + c['Make'])
        print('Model    : ' + c['Model'])
        print('Year     : ' + c['Year'])
        print('Miles    : ' + c['Miles'])
        print('=========== Next Car ===========')