code = ''
keypad = [
    [nil, nil, 1, nil, nil],
    [nil, 2, 3, 4, nil] ,
    [5, 6, 7, 8, 9],
    [nil, 'A', 'B', 'C', nil],
    [nil, nil, 'D', nil, nil]
]

row, column = 2, 0

File.readlines('./input.txt').each do |line|
  line.each_char do |dir|
    case dir
      when 'L'
        column -= 1 if column > 0 && keypad[row][column-1]
      when 'R'
        column += 1 if column < 4 && keypad[row][column+1]
      when 'U'
        row -= 1 if row > 0 && keypad[row-1][column]
      when 'D'
        row += 1 if row < 4 && keypad[row+1][column]
    end
  end

  code +=  keypad[row][column].to_s
end

puts code