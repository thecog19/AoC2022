SCORE_MATRIX = {
    "X" => 0,
    "Y" => 3,
    "Z" => 6
}

BONUS_POINTS = {
    "X" => {"A" => 3 , "B" => 1 , "C" => 2 },
    "Y" => {"A" => 1 , "B" => 2 , "C" => 3 },
    "Z" => {"A" => 2, "B" => 3 , "C" => 1 },
}

def read_file
    #reads the file and returns an array of the lines
    data = File.readlines("input.txt")
end

def calculate_score
    data = read_file
    score = 0
    data.each do |line|
        elf_move, human_move = line.split(" ")
        score += SCORE_MATRIX[human_move]
        score += BONUS_POINTS[human_move][elf_move]
    end
    return score
end

p calculate_score