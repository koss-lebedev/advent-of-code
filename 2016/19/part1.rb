# https://www.youtube.com/watch?v=uCsD3ZGzMgE

n = 3014603
bin = n.to_s(2)

puts (bin[1..-1] + bin[0]).to_i(2)