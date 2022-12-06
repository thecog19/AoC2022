def read_file
    data = File.read("input.txt")
end

def find_unique_substring(data)
    # we're going to scan this string keeping count of how many characters we've seen
    # whenever we have a string of four unique characters, we'll return how many characters we've seen

    char_arr = data.split("")
    substring = []
    chars_seen = 0
    char_arr.each do |char|
        chars_seen += 1
        substring << char
        substring.shift if substring.length > 4
        return chars_seen if  substring.uniq.length == 4
    end
end

p find_unique_substring(read_file)