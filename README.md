# assign-8-dypl
Dynamic class creation from CSV-formatted file. Assignment part of a course in dynamic programming languages.


Include code_generation and call #load_from_file to have arrays of objects created per definition in a CSV-formatted file.
The data headers will be transformed into instance variables and objects instantiated for each row.
The file name will be used to name the class.

E.g.

Dog.txt
--------
name, age, breed
"Totti", 13, "Parson Jack Russell"
"Bernard", 10, "Saint Bernard"

will have code_generation create a class Dog with attrs :name, :age, :breed
and then instantiate two objects, chuck them in an array, and return the array.
