def look_and_say_seq(input, times)
  if times.zero?
    input
  else
    new_seq = ''
    pointer = 0
    while pointer < input.size
      counter = 1
      while input[pointer + counter - 1] == input[pointer + counter]
        counter += 1
      end
      new_seq += "#{counter}#{input[pointer]}"
      pointer += counter
    end
    look_and_say_seq(new_seq, times - 1)
  end
end

puts look_and_say_seq('1113122113', 40).size