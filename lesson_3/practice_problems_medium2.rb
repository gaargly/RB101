# Question 1

# Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.
#
# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id # This will be different from a's object_id
puts c.object_id # This will be the same as a's object_id

# Question 2
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id # This will have the same object_id as a's because integers (in addition to true, false, and nil) are immutable
puts c.object_id # This will have the same object_id as a's and b's because integers (in addition to true, false, and nil) are immutable

# Question 3
# Let's call a method, pass two strings as arguments and see how they can be treated differently depending on the method invoked on them inside the method definition.
#
# Study the following code and state what will be displayed...and why:

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga" # Here, we are reassigning string_param_one away from the object that the parameter was initially pointing to. To a new string object. So, this is a non-mutating operation. The argument will not change.
  string_param_two << "rutabaga" # Here, we are mutating the object that the parameter is pointing to, so the original argument will change.
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}" # This will still be pumpins
puts "String_arg_two looks like this now: #{string_arg_two}" # This will change to pumpkinsrutabaga

# Question 4
# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga' # Mutating operation << will change the value of the argument passed into the method by appending rutabaga to it
  an_array_param = ['pumpkins', 'rutabaga'] # Non-mutating reassignment will leave array argument unchanged, because this new array is a new object
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 5
# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain? That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Note that line 10 of this solution demonstrates multiple assignment. Specifically, #not_so_tricky_method returns two values, these are assigned to local variables my_string and my array, respectively.

# Question 6
# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# My answer
def color_valid(color)
  color == "blue" || color == "green"
end
