Node = Struct.new(:name, :size, :children, :parent, :files)
def read_file(name)
    File.readlines(name).map(&:chomp)
end

def create_tree(input)
    node_map = {}
    curr_node_name = "/"
    root_node = Node.new("/", 0, [], nil, [])
    node_map[root_node.name] = root_node
    queue = []
    input.each do |line|
        if line.split(" ")[0] == "$"
            command = line.split(" ")[1]
            if command == "cd"
                parent = curr_node_name.split("\\")[0..-2].join("\\")
                process_queue(queue, node_map, curr_node_name, ) 
                up = line.split(" ")[2] == ".."
                curr_node_name = line.split(" ")[2] unless up
                curr_node_name = node_map[curr_node_name].parent if up
                queue = []
            end
        else 
            queue << line
        end
    end

    process_queue(queue, node_map, curr_node_name)
    calculate_sum_of_sizes(node_map)
end

def calculate_sum_of_sizes(node_map)
    sum = 0
    node_map.each do |key, value|
        sum += value.size if value.size <= 100000
    end
    p sum
end

def process_queue(queue, node_map, curr_node_name, parent)
    curr_node = node_map[curr_node_name]
    if curr_node.nil? 
        curr_node = Node.new(curr_node_name, 0, [], parent)
    end
    queue.each do |line|
        prefix = line.split(" ")[0]
        if prefix == "dir"
            name = curr_node.parent + "\\" + line.split(" ")[1]
            create_node(node_map, curr_node_name, name)
            curr_node.children << name
        else
            curr_node.files << line
            curr_node.size += line.split(" ")[0].to_i
        end 
    end
    update_size(curr_node, node_map)
    
end

# we need to add cycle detection

def update_size(curr_node, node_map)
    size = curr_node.size

    while curr_node.parent.nil? == false
        seen[curr_node.name] = true
        curr_node = node_map[curr_node.parent]
        curr_node.size += size
    end
    
end

def create_node(node_map, parent_node_name, node_name)
    node = Node.new(node_name, 0, [], parent_node_name, [])
    node_map[node_name] = node
end


create_tree(read_file("input.txt"))