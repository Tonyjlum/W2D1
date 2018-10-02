require_relative "board"
require_relative "cursor"
require "colorize"
require "byebug"
#can we list these requirements or not?

class Display
  attr_reader :cursor, :board

  def initialize(board = nil)
    board ||= Board.new
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render #need to DRY
    color_index = 0
    print "  0  1  2  3  4  5  6  7\n"
    board.grid.each.with_index do |row,row_index|
      row.each_with_index do |tile, i2|
        if [row_index,i2] == cursor.cursor_pos
          print "#{row_index}" if i2 == 0
          print " ".on_red.blink if tile.nil?
          print " #{tile} ".on_red.blink
          color_index +=1
        elsif color_index.even?
          print "#{row_index}" if i2 == 0
          print " ".colorize( background: :light_black) if tile.nil?
          print " #{tile} ".colorize( background: :light_black)
          color_index +=1
        else
          print "#{row_index}" if i2 == 0
          print " ".colorize( background: :light_white) if tile.nil?
          print " #{tile} ".colorize( background: :light_white)
          color_index +=1
        end
      end
      puts
      color_index += 1
    end
  end

  def dumb_play

    until false
      system "clear"
      render
      cursor.get_input
    end
  end

end

a = Display.new
a.dumb_play
