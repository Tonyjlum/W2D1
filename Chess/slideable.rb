module Slideable
  DIAGONAL_MATH = [[-1,-1],[1,1], [1,-1], [-1,1]]
  DIAGONAL_DIRS = [[-1,-1],[1,1], [1,-1], [-1,1]]
  HORIZONTAL_DIRS = [[1,0], [0,1], [-1,0], [0,-1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def move_dirs
    raise "you're in a module"
  end

  def moves(dir)
    results = []
    #run grow_unblock_moves(starting pos)
  end

  def diagonal_moves(start_pos)
    #figure out nested arrays of positions in all possible directions sets
    #refactor "all_possible_math" should have only 4 nested arrays of math
    #
    all_possible_math = []
    DIAGONAL_MATH.each do |integers|
      8.times do |i|
        #set a holder array to shovel into all possible math after the first 8
        all_possible_math << [integers[0] * i, integers[1] * i]
      end
    end

    moves = []
    #iterate through all math and then iterate through its arrays
    #add our start positions to it
    all_possible_math.each do |move|
      moves << [move.first + start_pos.first, move.last + start_pos.last]
    end

    #iterate through all math's children arrays and select only moves
    #within select criteria

    real_moves = moves.select do |pos|
      (0..7).include?(pos.first) && (0..7).include?(pos.last)
    end

    real_moves.uniq

  end

  def horizontal_moves(start_pos)
    (0..7).map { |el| [start_pos.first, el] }
  end

  def vertical_moves(start_pos)
    (0..7).map { |el| [el, start_pos.last] }
  end

end
