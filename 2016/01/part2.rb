# TODO: has errors

dir = :n
dir_map = { n: %i(w e), e: %i(n s), s: %i(e w), w: %i(s n) }
x, y = 0, 0
visited = Hash.new { |h, k| h[k] = [] }
visited[x] << y

File.read('./input.txt').split(', ').each_with_index do |point, index|
  turn = point.slice!(0)
  delta = point.to_i

  dir = dir_map[dir][turn == 'L' ? 0 : 1]

  case dir
    when :n
      (x+1).upto(x+delta).each do |i|
        if visited[i].include?(y)
          puts(index) && return
        end
        visited[i] << y
      end
    when :s
      (y-1).downto(y-delta).each do |i|
        if visited[x].include?(i)
          puts(index) && return
        end
        visited[x] << i
      end
    when :e
      (y+1).upto(y+delta).each do |i|
        puts(index) && return if visited[x].include?(i)
        visited[x] << i
      end
    when :w
      (x-1).downto(x-delta).each do |i|
        if visited[i].include?(y)
          puts(index) && return
        end
        visited[i] << y
      end
  end

end
