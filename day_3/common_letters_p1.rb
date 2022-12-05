


def find_common_letter(str1, str2)
    str1.split("").each do |char|
        if str2.include?(char)
        return char
        end
    end
end

def read_file
    #reads the file and returns an array of the lines
    data = File.readlines("input.txt")
end

def letter_to_number(letter)
  #this function maps the letters a-z to numbers 1-26
  # and A-Z to numbers 27-52
   if letter == letter.upcase
      return letter.ord - 38
   else
      return letter.ord - 96
   end
end

def split_string_in_half(str)
    str.partition(/.{#{str.size/2}}/)[1,2]
end

def calculate_scores
  data = read_file
  score = 0
  data.each do |line|
    first, second = split_string_in_half(line)
    common_letter = find_common_letter(first, second)
    score += letter_to_number(common_letter)
    p common_letter
    p letter_to_number(common_letter)
  end
  return score
end

p calculate_scores