# frozen_string_literal: true

def knight_moves(start, finish)
  path_hash = create_path(start, finish)
  path = reconstruct_path(finish, path_hash)
  print_result(path, start, finish)
end

def create_path(start, finish, queue = [start], visited = [start], path_hash = { start => nil })
  until queue.include?(finish)
    position = queue.shift
    possible_moves(position).each do |child|
      next if visited.include?(child)

      queue << child
      visited << child
      path_hash[child] = position
    end
  end
  path_hash
end

def possible_moves(position)
  movement = [[-1,-2], [-1,2], [-2,-1], [-2,1], [1,-2], [1,2], [2,-1], [2,1]]
  moves = []
  movement.each do |move|
    x = position[0] + move [0]
    y = position[1] + move[1]
    moves << [x, y] if x >= 1 && x <= 8 && y >= 1 && y <= 8
  end
  moves
end

def reconstruct_path(finish, path_hash)
  path = []
  position = finish
  until position.nil?
    path << position
    position = path_hash[position]
  end
  path.reverse
end

def print_result(path, start, finish)
  puts "The shortest path from #{start} to #{finish} takes #{path.length - 1} moves:"
  path.each { |move| p move }
end


knight_moves([1,1], [1,1])
