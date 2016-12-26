class Disk < Struct.new(:size, :start)

  def open?(time)
    (start + time) % size == 0
  end

end

def solve(disks)
  t = 0

  catch(:found) do
    loop do
      t += 1

      disks.each_with_index do |disk, index|
        break unless disk.open?(t + index)
        throw :found if index == disks.size - 1
      end
    end
  end

  t-1
end

part1 = [
    Disk.new(17, 1),
    Disk.new(7, 0),
    Disk.new(19, 2),
    Disk.new(5, 0),
    Disk.new(3, 0),
    Disk.new(13, 5)
]

part2 = part1 + [Disk.new(11, 0)]

puts solve(part1)
puts solve(part2)