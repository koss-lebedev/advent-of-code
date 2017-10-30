sum = 0

File.readlines('./input.txt').each do |line|
  nums = line.split(' ').map(&:to_i).sort { |a,b| b <=> a }
  (0...nums.size).each do |i|
    (i+1...nums.size).each do |j|
      div, mod = nums[i].divmod(nums[j])
      if mod.zero?
        sum += div 
      end
    end
  end
end

puts sum
