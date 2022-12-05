def read_file
    #reads the file and returns an array of the lines
    data = File.readlines("input.txt")
end

def sections_overlap?(sec1, sec2)
    sec1_first, sec1_last = sec1.split("-").map(&:to_i)
    sec2_first, sec2_last = sec2.split("-").map(&:to_i)
    if sec1_first <= sec2_first && sec1_last >= sec2_last
        return true
    elsif sec2_first <= sec1_first && sec2_last >= sec1_last
        return true
    else
        return false
    end
end

def find_overlapping_sections
    total = 0
    data = read_file
    data.each do |line|
        first, second = line.split(",")
        if sections_overlap?(first, second)
            total += 1
        end
    end
    return total
end

p find_overlapping_sections
    