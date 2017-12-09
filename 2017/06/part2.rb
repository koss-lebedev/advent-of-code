memory = [2, 8, 8, 5, 4, 2, 3, 1, 5, 5, 1, 2, 15, 13, 5, 14] 
cycle = 0
seen = {}

def redistribute(mem)
  max = mem.max
  idx = mem.index(max)
  mem[idx] = 0
  max.times do
    idx = (idx + 1) % mem.size
    mem[idx] += 1
  end
end

loop do
  if seen[memory]
    puts cycle - seen[memory]
    break
  else
    seen[memory] = cycle
  end

  redistribute memory
  cycle += 1
end
