# frozen_string_literal: true

def new?(number)
  digits_of_number = number.digits
  min = number
  digits_of_number.permutation(digits_of_number.size).map do |permutation_string|
    word = permutation_string.join
    permutation = word.to_i
    min = permutation if !word.start_with?('0') && permutation < number
  end
  min == number
end

puts new?(30)
puts new?(7050)
puts new?(70_077)
puts is_new_number?(70_077)
 