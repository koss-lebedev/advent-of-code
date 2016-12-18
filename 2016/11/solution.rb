State = Struct.new(:elevator, :floors, :distance) do

  def final?
    floors[0].empty? && floors[1].empty? && floors[2].empty?
  end

  def move_items(items, from, to)
    to_state = Marshal.load( Marshal.dump(self) )
    to_state.elevator = to
    to_state.distance = distance + 1
    to_state.floors[to] += items

    to_state.floors[from] = to_state.floors[from].reject{ |item| items.include?(item) }
    to_state
  end

  def to_s
    floors.map { |floor| floor.sort.map{ |item| item > 0 ? 'G' : 'C' }.join }.join('|') + "x#{elevator}"
  end

  def floors_valid?(*floor_nums)
    floor_nums.all? { |floor_num| floor_valid? floor_num }
  end

  def floor_valid?(floor_number)
    gens = floors[floor_number].select { |item| item > 0 }
    chips = floors[floor_number].select { |item| item < 0 }.map(&:abs)

    chips.empty? || gens.empty? || (chips - gens).empty?
  end

end

class Puzzle

  def initialize(state)
    @queue = [state]
    @past_states = []
  end

  def solve
    until queue.empty?
      current = queue.shift

      if current.final?
        puts current.distance
        break
      end

      if current.elevator < 3
        enqueue_moves(current, current.elevator, current.elevator + 1)
      end

      if current.elevator > 0
        enqueue_moves(current, current.elevator, current.elevator - 1)
      end

    end
  end

private

  attr_reader :queue, :past_states

  def enqueue_moves(state, from, to)

    return if from > to &&  (0..to).all? { |floor| state.floors[floor].empty? }

    moves = (from < to) ? get_two_items_moves(state, from, to) : get_one_item_moves(state, from, to)
    if moves.empty?
      moves += (from < to) ? get_one_item_moves(state, from, to) : get_two_items_moves(state, from, to)
    end

    moves.each do |move|
      unless past_states.include? move.to_s
        past_states << move.to_s
        queue.push move
      end
    end
  end

  def get_one_item_moves(state, from, to)
    state.floors[from].map do |item|
      move = state.move_items([item], from, to)
      (move.floors_valid?(from, to)) ? move : nil
    end.compact
  end

  def get_two_items_moves(state, from, to)
    state.floors[from].combination(2).map do |pair|
      move = state.move_items(pair, from, to)
      (move.floors_valid?(from, to)) ? move : nil
    end.compact
  end

end

part1 = State.new(0, [
    [1, -1, 2, -2],
    [3, 4, -4, 5, -5],
    [-3],
    []
], 0)

part2 = State.new(0, [
    [1, -1, 2, -2, 6, -6, 7, -7],
    [3, 4, -4, 5, -5],
    [-3],
    []
], 0)

Puzzle.new(part1).solve
Puzzle.new(part2).solve