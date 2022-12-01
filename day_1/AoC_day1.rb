def read_file
    #reads the file and returns an array of the lines
    data = File.readlines("data_day_1.txt")
end

def calculate_calories_top_elf
    data = read_file
    all_elves = []
    max_calories = 0
    data.each do |line|
        #converts the string to an integer
        if line == "\n"
            #this is a new elf
            all_elves << max_calories 
            max_calories = 0
        else
            max_calories += line.to_i
        end
    end

    return all_elves.sort.reverse[0]]
end



def calculate_calories_top_3
    data = read_file
    all_elves = []
    max_calories = 0
    data.each do |line|
        #converts the string to an integer
        if line == "\n"
            #this is a new elf
            all_elves << max_calories 
            max_calories = 0
        else
            max_calories += line.to_i
        end
    end

    return all_elves.sort.reverse[0..2].sum()
end

p calculate_calories_top_elf
p calculate_calories_top_3