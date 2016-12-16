require 'digest'

key = 'bgvyzdsv'

index = 0

8.times do
  loop do
    hash = Digest::MD5.hexdigest "#{key}#{index}"
    break if hash.start_with?('000000')
    index += 1
  end
end


puts index