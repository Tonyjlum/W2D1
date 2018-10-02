require_relative "board"

class Piece
  attr_reader :name

  def initialize
    @piece_pos = nil

    @name = "\u265F"
  end

  def to_s
    self.name.to_s
  end

  def moves
    #return an array of possible moves
    #not implemented error to make sure each subclass did its job 
  end

end
