Tree = Struct.new(:x, :y, :height, :visible)


def read_file(name)
    File.readlines(name).map(&:chomp)
end

def populate_forest
    forest = {}
    data = read_file("input.txt")
    data.each_with_index do |line, y|
        line.split("").each_with_index do |char, x|
            tree = Tree.new(x, y, char.to_i, false)
            forest[[x, y]] = tree
        end
    end
    forest
end

def find_visible_trees(forest)
    #first do each row left to right 
    #then right to left
    #then each column top to bottom
    #then bottom to top
    highest_x =  forest.max_by{|k,v| k[0]}
    highest_x = highest_x[0][0]
    highest_y =  forest.max_by{|k,v| k[1]}
    highest_y = highest_y[0][1]

    #left to right
    curr_x = 0
    curr_y = 0
    curr_node = forest[[curr_x, curr_y]]
    highest_seen = -1
    while curr_y <= highest_y
       
        while curr_node != nil
            forest[[curr_x, curr_y]] = curr_node
            if curr_node.height > highest_seen 
                curr_node.visible = true
                forest[[curr_x, curr_y]] = curr_node
                highest_seen = curr_node.height
            end
            curr_x += 1
            curr_node = forest[[curr_x, curr_y]]
        end
        curr_y += 1
        curr_x = 0
        highest_seen = -1
        curr_node = forest[[curr_x, curr_y]]
    end

    #right to left
    curr_x = highest_x
    curr_y = 0
    curr_node = forest[[curr_x, curr_y]]
    highest_seen = -1
    while curr_y <= highest_y
        while curr_node != nil
            if curr_node.height > highest_seen 
                curr_node.visible = true
                forest[[curr_x, curr_y]] = curr_node
                highest_seen = curr_node.height
            end
            curr_x -= 1
            curr_node = forest[[curr_x, curr_y]]
        end
        curr_y += 1
        curr_x = highest_x
        highest_seen = -1
        curr_node = forest[[curr_x, curr_y]]
    end

    #top to bottom
    curr_x = 0
    curr_y = 0
    curr_node = forest[[curr_x, curr_y]]
    highest_seen = -1
    while curr_x <= highest_x
        while curr_node != nil
            if curr_node.height > highest_seen 
                curr_node.visible = true
                forest[[curr_x, curr_y]] = curr_node
                highest_seen = curr_node.height
            end
            curr_y += 1
            curr_node = forest[[curr_x, curr_y]]
        end
        curr_x += 1
        curr_y = 0
        highest_seen = -1
        curr_node = forest[[curr_x, curr_y]]
    end

    #bottom to top
    curr_x = 0
    curr_y = highest_y
    curr_node = forest[[curr_x, curr_y]]
    highest_seen = -1
    while curr_x <= highest_x
        while curr_node != nil
            if curr_node.height > highest_seen 
                curr_node.visible = true
                forest[[curr_x, curr_y]] = curr_node
                highest_seen = curr_node.height
            end
            curr_y -= 1
            curr_node = forest[[curr_x, curr_y]]
        end
        curr_x += 1
        curr_y = highest_y
        highest_seen = -1
        curr_node = forest[[curr_x, curr_y]]
    end
    forest
end

def count_visible_trees(forest)
    forest.values.count{|tree| tree.visible}
end


forest = populate_forest
forest = find_visible_trees(forest)
p count_visible_trees(forest)
