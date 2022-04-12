#? git ----------------------------------------------------------------
#* git add --all = git add -A
# * *feat*: for features
#   * *fix*: for bug fixes
#   * *chore*: for chores, e.g. implementing build scripts
#   * *docs*: for documentation improvements
#   * *perf*: for performance improvements
#   * *refactor*: for refactors
#   * *style*: for stylistic changes, e.g. replace tabs w/ spaces
#   * *test*: for tests improvements

#   support@leanbit.it
#
#
#
#

print 'hi'
puts ' hello'

puts 100 + '50'.to_i

#? ARRAYS ----------------------------------------------------------------
lucky_numbers = [4, 8, 'fifteen', 16, 23, 42.0]
#3 indexes 0 1 3 4 5
lucky_numbers[0] = 90
puts lucky_numbers
# puts lucky_numbers[1]
# puts lucky_numbers[-1]
# puts "\n\n"
# puts lucky_numbers[2,3]
# puts "\n\n"
# puts lucky_numbers[2..4]
# puts "\n\n"
# puts lucky_numbers.length

puts [1, 2, 3].select(&:even?)

#? strings ----------------------------------------------------------------
location = 'World'
# And double quotes when interpolated
puts "Hello, #{location}!" #=> "Hello, World!"

my_string = 'Some string'
my_string.size #=> 11

my_string[0] #=> 'S'
my_string[-1] #=> 'g'

# Find the first index of a character
my_string.index('m') #=> 2
# Find three characters starting with the second character (index 1)
my_string[1, 3] #=> "ome"
my_string.slice(1, 3) #=> "ome"

'hello'.center(22) #=> "       hello        "
'  hello  '.strip #=> "hello"

# Replace one character with another
'noob'.gsub('o', '0') #=> "n00b"

# (Advanced) Replace a regular expression
'Ruby really rocks'.gsub(/[aieou]/, '') #=> "Rby rlly rcks"

# And bang-methods (...!) to modify the object
my_string = 'hello'
my_string.capitalize! #=> "Hello"
puts my_string #=> "Hello"

#? classes ----------------------------------------------------------------
# Ruby Program of getter method
class Website
  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website)
    @website = website
  end

  # getter method
  def website
    @website
  end

  # setter method
  def website=(newWebsite)
    @website = newWebsite
  end
end

# Creating an object of the class
g = Website.new 'www.google.org'
puts g.website

# Change the instance variable from
# Outside the class
g.website = 'www.practice.geeksforgeeks.org'
puts g.website

#? Arrays ----------------------------------------------------------------

fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count { |number| number == 1 } #=> 2
fibonacci.any? { |number| number == 6 } #=> false
fibonacci.select { |number| number.odd? } #=> [1, 1, 3, 5, 13]
fibonacci.all? { |number| number < 20 } #=> true
fibonacci.map { |number| number * 2 } #=> [0, 2, 2, 4, 6, 10, 16, 26]

#? OpenStruct ----------------------------------------------------------------

require 'ostruct'

# person = OpenStruct.new(name: 'Burdette Lamar', city: 'Houston', state: 'TX')
#* or
person = OpenStruct.new
person.name = 'John Smith'
person.age = 70

p person[:age] # => 70
p person['address'] # => nil

p person.hair_color = :gray
p person[:eye_color] = :brown
p person['hair_style'] = :ponytail
p person.to_h #* get all attributes as a hash
p person.to_h { |name, value| [name.to_s, value.to_s] }

person.each_pair { |name, value| p [name, value] }

enum = person.each_pair
p enum
