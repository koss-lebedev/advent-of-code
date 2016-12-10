counter = 0

File.readlines('./input.txt').each do |line|
  a, b = nil, nil
  expect_aba_match = true
  aba_matches = []
  bab_matches = []

  line.each_char do |char|
    if char == '['
      expect_aba_match = false
    elsif char == ']'
      expect_aba_match = true
    else
      if (a == char) && (a != b) && (b != '[') && (b != ']')
        if expect_aba_match
          aba_matches << "#{a}#{b}#{a}"
        else
          bab_matches << "#{b}#{a}#{b}"
        end
      end
    end

    a = b
    b = char
  end

  if bab_matches.size > 0 && !(bab_matches & aba_matches).empty?
    counter += 1
  end
end

puts counter