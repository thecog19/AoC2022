def find_common_letter(str1, str2, str3)
    str1.split("").each do |char|
        if str2.include?(char) && str3.include?(char)
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

  
def calculate_scores
    #we need to consider three array elements at the time
    #so we need to iterate over the array in steps of 3
    data = read_file
    score = 0
    elements_seen = 0
    first, second, third = "", "", ""
    data.each do |line|
        if elements_seen == 0
            first = line
            elements_seen += 1
        elsif elements_seen == 1
            second = line
            elements_seen += 1
        else
            third = line
            p first
            p second
            p third
            common_letter = find_common_letter(first, second, third)
            score += letter_to_number(common_letter)
            elements_seen = 0
        end
    end
    return score
end

p calculate_scores
