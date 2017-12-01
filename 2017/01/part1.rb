input = File.read('./input.txt')

sum = 0
handler = ->(a, b) { sum += a.to_i if a == b }

handler.call(input[0], input[-1])
input.chars.each_cons(2) { |a, b| handler.call(a, b) }

puts sum