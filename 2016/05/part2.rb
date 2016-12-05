require 'digest'

VALID_CHARS = %w(0 1 2 3 4 5 6 7)
door_id = 'cxdnnyjw'

code = []
index = 0

loop do
  hash = Digest::MD5.hexdigest "#{door_id}#{index}"
  index += 1
  if hash.start_with?('00000') && VALID_CHARS.include?(hash[5])
    next if code[hash[5].to_i]
    code[hash[5].to_i] = hash[6]
    break if code.compact.size == 8
  end
end

puts code.join