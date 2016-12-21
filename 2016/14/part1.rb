require 'digest'

salt = 'qzyelonm'
i = 0
counter = 0
hashes = Hash.new { |h, k| h[k] = Digest::MD5.hexdigest("#{salt}#{k}") }

while counter < 64
  if hashes[i].match /(\w)\1\1/
    char = $1
    j = i + 1
    while j < i + 1000
      if hashes[j].match /#{char * 5}/
        counter += 1
        if counter == 64
          puts i
          break
        end
      end
      j += 1
    end
  end
  i += 1
end

