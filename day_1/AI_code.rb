# Read the input data from a file
data = File.readlines("data_day_1.txt")

# Initialize variables
calories = []
elf = 0
max = 0

# Iterate over the input data
data.each do |line|
  # If a newline character is encountered, add the current elf to the list of calories and reset the elf variable
  if line == "\n"
    calories << elf
    elf = 0
  else
    # ELSE, add the current calorie to the current elf's total
    elf += line.to_i

    # Update the maximum calories variable
    max = elf if elf > max
  end
end

# Print the result
puts max
