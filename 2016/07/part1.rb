counter = 0

File.readlines('./input.txt').each do |line|
  a, b, c = nil, nil, nil
  expect_match = true
  match_state = :unknown

  line.each_char do |char|
    if char == '['
      expect_match = false
    elsif char == ']'
      expect_match = true
    else
      if (a == char) && (b == c) && (a != b)
        match_state = expect_match ? :found : :fail
      end
    end

    a = b
    b = c
    c = char

    break if match_state == :fail
  end

  counter += 1 if match_state == :found
end

puts counter