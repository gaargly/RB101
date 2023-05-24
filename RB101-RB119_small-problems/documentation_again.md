# RB109-RB119: Small Problems
# Documentation Again

# 1. Class and Instance Methods

Locate the ruby documentation for methods File::path and File#path. How are they different?

# My Answer
From: https://docs.ruby-lang.org/en/2.7.0/File.html#method-c-path
File::path returns the string representation for the path.

File.path("/dev/null")          #=> "/dev/null"
File.path(Pathname.new("/tmp")) #=> "/tmp"

Whereas...
From: https://docs.ruby-lang.org/en/2.7.0/File.html#method-i-path
File#path
  Returns the pathname used to create file as a string. Does not normalize the name.
  The pathname may not point to the file corresponding to file. For instance, the pathname becomes void when the file has been moved or deleted.
  This method raises IOError for a file created using File::Constants::TMPFILE because they do not have a pathname.

File.new("testfile").path               #=> "testfile"
File.new("/tmp/../tmp/xxx", "w").path   #=> "/tmp/../tmp/xxx"

Launch School Answer
Both methods can be found on the documentation page for the File class in the Core API section. File::path is a class method, while File#path is an instance method.

# Class methods are called on the class, while instance methods are called on objects. Thus:
  puts File.path('bin')
# calls the class method File::path since we're calling it on the File class, while:
  f = File.new('my-file.txt')
  puts f.path
# calls the instance method File#path since we're calling it on an object of the File class, namely f.
# Pay attention when reading the documentation; make sure you are using a class method when you need a class method, and an instance method when you need an instance method.

# 2. Optional Arguments Redux

# Assume you have the following code:
require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)

# What will each of the 4 puts statements print?
-4712-01-01
2016-01-01
2016-05-01
2016-05-13

Documentation: https://ruby-doc.org/stdlib-2.7.0/libdoc/date/rdoc/Date.html#method-c-civil

# 3. Default Arguments in the Middle

# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.
[4, 5, 3, 6]
https://docs.ruby-lang.org/en/2.7.0/syntax/calling_methods_rdoc.html

# 4. Mandatory Blocks

# The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]

# How would you search this Array to find the first element whose value exceeds 8?

a.bsearch {|num| num > 8}

From Ruby Docs: https://docs.ruby-lang.org/en/2.7.0/Array.html#method-i-bsearch

https://docs.ruby-lang.org/en/2.7.0/Array.html#method-i-bsearch

# 5. Multiple Signatures

# What do each of these puts statements output?

```
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

```
From https://docs.ruby-lang.org/en/2.7.0/Array.html#method-i-fetch

"Tries to return the element at position index, but throws an IndexError exception if the referenced index lies outside of the array bounds. This error can be prevented by supplying a second argument, which will act as a default value.

Alternatively, if a block is given it will only be executed when an invalid index is referenced.

Negative values of index count from the end of the array."

# 6. Keyword Arguments
# What does this code print?

```
5.step(to: 10, by: 3) { |value| puts value }
```

It prints:
5
8

https://docs.ruby-lang.org/en/2.7.0/Numeric.html#method-i-step

# 7. Parent Class
# Use irb to run the following code:

```
s = 'abc'
puts s.public_methods.inspect
```

# How would you modify this code to print just the public methods that are defined or overridden by the String class? That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.

s = 'abc'
puts s.public_methods(false).inspect

# 8. Included Modules
For this exercise, start by using version 2.3.0 of the Ruby Array Documentation:
  https://ruby-doc.org/core-2.3.0/Array.html
If you use a more recent version of the documentation, you won't get the full benefit of this exercise.
You don't have to install Ruby 2.3.0 - you can use any more recent version to test the code.

Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min

Find the documentation for the #min method and change the above code to print the two smallest values in the Array.

https://ruby-doc.org/core-2.3.0/Enumerable.html#method-i-min

a = [5, 9, 3, 11]
puts a.min
puts a.min(2)

# 9. Down the Rabbit Hole
Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing a program
that loads some text messages from a YAML file. We do this with YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

Find the documentation for YAML::load_file.

# The YAML module is an alias of Psych, the YAML engine for Ruby.

https://ruby-doc.org/stdlib-2.7.0/libdoc/psych/rdoc/Psych.html#method-c-load_file
