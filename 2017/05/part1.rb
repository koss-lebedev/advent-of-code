insts = File.readlines('./input.txt').map(&:to_i)
jumps, pointer = 0, 0

while (pointer >= 0) && (pointer < insts.size)
  inst = insts[pointer]
  insts[pointer] += 1
  pointer += inst
  jumps += 1
end

p jumps