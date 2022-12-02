SCORE_MATRIX = {
    "X" => {"A" => 3 , "B" => 0 , "C" => 6 },
    "Y" => { "A" => 6, "B" =>  3 , "C" => 0},
    "Z" => { "A" => 0, "B" => 6 , "C" => 3},
}

BONUS_POINTS = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
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
        score += SCORE_MATRIX[human_move][elf_move]
        score += BONUS_POINTS[human_move]
    end
    return score
end

p calculate_score