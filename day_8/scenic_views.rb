Tree = Struct.new(:x, :y, :height, :visible, :score)


def read_file(name)
    File.readlines(name).map(&:chomp)
end

def populate_forest
    forest = {}
    data = read_file("test.txt")
    data.each_with_index do |line, y|
        line.split("").each_with_index do |char, x|
            tree = Tree.new(x, y, char.to_i, false, 1)
            forest[[x, y]] = tree
        end
    end
    forest
end

def calculate_scene_score_per_tree
    forest = populate_forest
    iterative_forest = forest.dup
    iterative_forest.each do |k, v|
        calculate_scene_score(forest, v)
    end
    forest
end

def calculate_scene_score(forest, tree)
    p "calculating score for #{tree.x}, #{tree.y}"
    highest_x =  forest.max_by{|k,v| k[0]}
    highest_x = highest_x[0][0]
    highest_y =  forest.max_by{|k,v| k[1]}
    highest_y = highest_y[0][1]

    original_x = tree.x
    original_y  = tree.y


    #check how many trees are visible from this tree
    original_node = forest[[tree.x, tree.y]]
    highest_seen = original_node.height

    #if the tree is on an edge set the score to 0
    if tree.x == 0 || tree.x == highest_x  || tree.y == 0 || tree.y == highest_y 
        original_node.score = 0
        forest[[tree.x, tree.y]] = original_node
        return
    end

    
    #check left
    curr_x = tree.x - 1
    curr_y = tree.y
    curr_node = forest[[curr_x , curr_y]]
    temp_score = 0

    while curr_x >= 0
        if curr_node.nil?
            break
        end
        # p "curr node: height vs highest seen: #{curr_node.height} vs #{highest_seen}"
        if curr_node.height < highest_seen
            temp_score += 1
        else 
            temp_score += 1
            break
        end
        curr_x -= 1
        curr_node = forest[[curr_x, curr_y]] 
    end
    original_node.score = (original_node.score * temp_score)
    forest[[original_x, original_y]] = original_node

    #check right
    curr_x = tree.x + 1
    curr_y = tree.y
    curr_node = forest[[curr_x, curr_y]]
    temp_score = 0
    while curr_x <= highest_x
        if curr_node.nil?
            break
        end
        # p "curr node: height vs highest seen: #{curr_node.height} vs #{highest_seen}"
        if curr_node.height < highest_seen
            temp_score += 1
        else 
            temp_score += 1
            break
        end
        curr_x += 1
        curr_node = forest[[curr_x, curr_y]] 
    end
    original_node.score = (original_node.score * temp_score)
    forest[[original_x, original_y]] = original_node 

    #check up
    curr_x = tree.x
    curr_y = tree.y - 1
    curr_node = forest[[curr_x, curr_y ]]
    temp_score = 0
    
    while curr_y >= 0
        if curr_node.nil?
            break
        end
        # p "curr node: height vs highest seen: #{curr_node.height} vs #{highest_seen}"
        if curr_node.height < highest_seen
            temp_score += 1
        else
            temp_score += 1
            break
        end
        curr_y -= 1
        curr_node = forest[[curr_x, curr_y]] 
    end
    original_node.score = (original_node.score * temp_score)
    forest[[original_x, original_y]] = original_node

    #check down
    curr_x = tree.x
    curr_y = tree.y + 1
    curr_node = forest[[curr_x, curr_y]]
    highest_seen = curr_node.height
    temp_score = 0
    while curr_y <= highest_y
        if curr_node.nil?
            break
        end

        # p "curr node: height vs highest seen: #{curr_node.height} vs #{highest_seen}"
        if curr_node.height < highest_seen
            temp_score += 1
        else
            temp_score += 1
            break
        end
        curr_y += 1
        curr_node = forest[[curr_x, curr_y]] 
    end
    original_node.score = (original_node.score * temp_score)
    forest[[original_x, original_y]] = original_node 
end

def find_highest_scoring_tree(forest)
    highest_scoring_tree = forest.max_by{|k,v| v.score}
    highest_scoring_tree[1]
end

def main
    forest = calculate_scene_score_per_tree
    highest_scoring_tree = find_highest_scoring_tree(forest)
    puts "Highest scoring tree is at #{highest_scoring_tree.x}, #{highest_scoring_tree.y} with a score of #{highest_scoring_tree.score}"
end

main