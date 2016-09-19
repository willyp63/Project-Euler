def max_path(triangle_file)
  triangle = []
  File.open(triangle_file, "r") do |file|
    file.each_line do |line|
      triangle << line.split(" ").map! { |str| str.to_i }
    end
  end

  triangle.reverse!
  1.upto(triangle.count - 1) do |row_idx|
    previous_row = triangle[row_idx - 1]
    row = triangle[row_idx]
    0.upto(row.count - 1) do |col_idx|
      row[col_idx] += [previous_row[col_idx], previous_row[col_idx + 1]].max
    end
  end

  triangle.last.last
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 67: #{max_path('p67_triangle.txt')}"
end
