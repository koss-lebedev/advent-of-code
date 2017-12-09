memory = [2, 8, 8, 5, 4, 2, 3, 1, 5, 5, 1, 2, 15, 13, 5, 14] 
cycles = 0
seen = {}

def seen_before?(mem, seen)
  if seen[mem]
    true
  else
    seen[mem] = true
    false
  end
end

def redistribute(mem)
  max = mem.max
  idx = mem.index(max)
  mem[idx] = 0
  max.times do
    idx = (idx + 1) % mem.size
    mem[idx] += 1
  end
end

until seen_before? memory, seen
  redistribute memory
  cycles += 1
end

puts cycles
