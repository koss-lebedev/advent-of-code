def look_and_say_seq(input)
  input.gsub(/(.)\1*/) { |match| match.size.to_s + match[0] }
end

input = '1113122113'
50.times { input = look_and_say_seq(input) }
puts input.size