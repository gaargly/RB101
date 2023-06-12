#
# require "pry"
#
# a = [1, 2, 3]
# a << 4
# binding.pry    # execution will pause here, allowing you to inspect all objects
# puts a

def is_an_ip_number?(num)
  (0..255).cover?(num)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      break unless is_an_ip_number?(word)
    end
    return true
  end
end
