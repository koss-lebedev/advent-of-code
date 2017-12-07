inst = File.readlines('./input.txt').map(&:to_i)
jumps, pointer = 0, 0

while (pointer >= 0) && (pointer < inst.size)
  offset = inst[pointer]
  inst[pointer] +=  offset > 2 ? -1 : 1
  pointer += offset
  jumps += 1
end

p jumps