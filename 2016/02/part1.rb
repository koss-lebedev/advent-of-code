code = ''
keypad = [ [1,2,3], [4,5,6], [7,8,9] ]

x, y = 1, 1

File.readlines('./input.txt').each do |line|
  line.each_char do |dir|
    case dir
      when 'U'
        x -= 1 if x > 0
      when 'D'
        x += 1 if x < 2
      when 'L'
        y -= 1 if y > 0
      when 'R'
        y += 1 if y < 2
    end
  end

  code += keypad[x][y].to_s
end

puts code