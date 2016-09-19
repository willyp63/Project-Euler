def num_paths(grid_size)
  paths = Array.new(grid_size + 1) do |row|
    Array.new(grid_size + 1) do |col|
      if row == 0 || col == 0
        1
      else
        -1
      end
    end
  end

  paths(grid_size, grid_size, paths)
end

def paths(rows, cols, paths)
  if paths[rows][cols] > 0
    paths[rows][cols]
  else
    paths[rows][cols] = paths(rows - 1, cols, paths) + paths(rows, cols - 1, paths)
    paths[cols][rows] = paths[rows][cols]
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 15: #{num_paths(20)}"
end
