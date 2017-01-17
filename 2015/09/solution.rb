input = File.readlines 'input.txt'

graph = Hash.new { |h, k| h[k] = Hash.new }
places = []

input.each do |line|
  matches = line.match /(\w+)\sto\s(\w+)\s=\s(\d+)/
  a, b, dist = matches[1], matches[2], matches[3].to_i
  graph[a][b] = dist
  graph[b][a] = dist

  places << a unless places.include? a
  places << b unless places.include? b
end

shortest = (2**(0.size * 8 - 2) -1 )
longest = 0

places.permutation.each do |route|
  dist = 0
  prev = route.shift
  route.each do |place|
    dist += graph[prev][place]
    prev = place
  end

  shortest = dist if dist < shortest
  longest = dist if dist > longest
end

puts shortest
puts longest