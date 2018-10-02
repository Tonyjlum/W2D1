require_relative "piece"
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def populate
    (0..1).each do |x|
      (0..7).each do |y|
        self[[x,y]] = Piece.new
      end
    end
    (6..7).each do |x|
      (0..7).each do |y|
        self[[x,y]] = Piece.new
      end
    end
  end

  def move_piece (start_pos, end_pos)
    unless valid_start?(start_pos)
      raise "There is no piece at #{start_pos}!" # make error in errors.rb
    end

    unless valid_end?(end_pos)
      raise "You cannot put the piece at #{end_pos}" # make error in errors.rb
    end

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]

  end

  def valid_start?(start_pos)
    self[start_pos].is_a?(Piece) #placeholder till we know whats up
  end

  def valid_end?(end_pos)
    self[end_pos].nil? #change to Null_piece
  end

  def valid_pos?(pos)
    pos.all? { |index| (0..7).include?(index) } 
  end

end
