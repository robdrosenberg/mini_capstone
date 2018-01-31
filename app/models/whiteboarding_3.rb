#Problem ONE
# --------------
#input: a string "abcde"
#output: reversed string "edcba"

# string variable with abcde
# create an empty string
# iterate through the string and place it at the start of a new string
# puts the string

#Big O: linear

#solution 1
def reverse_it(str)
  empty_str =""
  i = -1
  str.length.times do
    empty_str += str[i]
    i-=1
  end
  empty_str
end

puts reverse_it("abcde")

#solution 2
def reverse_again(str)
  reversed = ""
  str.each_char{|char| reversed.insert(0,char)}
  reversed
end

puts reverse_again("abcde")

#solution 3

def reversin(str)
  backwards = ""
  str.split("").map { |char| backwards.prepend(char) }
  backwards
end

puts reversin("abcde")


#Problem 3
#-------------------

#input = A sorted array of numbers and the number we want to find ([1,1,2,2,3,4], 3)
#output = the index of the number we're looking for = 4

#write a method called find_dat_numb
#we'll find the number in the middle of the array
#compare it to the number we are looking for
#if middle number is equal to inputed numb return index
#if the middle number is bigger than the number we're looking for we'll look at the middle number in the bottom half of the array and compare it to the inputted number
#if the middle number is smaller we'll search the top half


def find_dat_numb(arr, numb)
  middle = arr.length/2
  if arr[middle] == numb
    arr[middle]
  elsif numb < arr[middle]
    [0..middle]
  elsif numb > arr[middle]
    [middle..arr.length]
      
end


# find_dat_numb([1,1,2,2,3,4,7], 3)

#2
def binary_search(sorted_array, desired_item)
  # your code goes here!
  size = sorted_array.length
  lower = 0
  upper = size
  found_number = nil

  while found_number != desired_item
    if upper < lower
      return nil
      exit
    end
    middle = lower + (upper - lower) / 2
    if sorted_array[middle] == desired_item
      found_number = sorted_array[middle]
    elsif sorted_array[middle] < desired_item
      lower = middle+1
    elsif sorted_array[middle] > desired_item
      upper = middle - 1
    end
  end
  return middle
end

p binary_search([2, 6, 10, 17, 18, 19, 29, 37, 72], 18)
p binary_search([2, 6, 10, 17, 18, 19, 29, 37, 72], 6)
p binary_search([2, 6, 10, 17, 18, 19, 29, 37, 72], 37)
p binary_search([2, 6, 10, 17, 18, 19, 29, 37, 72], 9)
