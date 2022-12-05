cranes = {
    1 => ["D","H","R","Z","S","P","W","Q"],
    2 => ["F","H","Q","W","R","B","V"],
    3 => ["H", "S", "V", "C"],
    4 => ["G","F","H"],
    5 => ["Z","B","J","G","P"],
    6 => ["L", "F", "W", "H","J","T","Q"],
    7 => ["N","J","V","L", "D", "W","T", "Z"],
    8 => ["F", "H", "G", "J", "C", "Z", "T", "D"],
    9 => ["H", "B", "M", "V", "P", "W"],
}

def move_boxes(cranes)
    data = File.readlines("input.txt")
    data.each do |line|
        number_to_move = line.split("from")[0].split(" ")[1].to_i
        from = line.split("from")[1].split("to")[0].to_i
        to = line.split("from")[1].split("to")[1].to_i
        cranes[to] = cranes[from].slice!(0...number_to_move) + cranes[to]
    end
end

def print_word(cranes)
    word = ""
    cranes.each do |key, value|
        word += value[0]
    end
    return word
end

move_boxes(cranes)
p print_word(cranes)