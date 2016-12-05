require 'digest'

door_id = 'cxdnnyjw'

index = 0
code = ''

8.times do
  loop do
    hash = Digest::MD5.hexdigest "#{door_id}#{index}"
    index += 1
    if hash.start_with?('00000')
      code += hash[5]
      break
    end
  end
end


puts code