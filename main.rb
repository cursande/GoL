
# frozen_string_literal: true

require_relative './lib/board.rb'
require_relative './lib/draw.rb'
require 'matrix'

# puts "number of rows? \n"
# rows = gets STDIN.chomp
# puts "number of columns? \n"
# cols = gets STDIN.chomp

rows, cols = 25, 25

# start initial board before loop, cells are randomly ON or OFF
start_grid = Matrix.build(rows, cols) { Cell.new(rand(2) == 1) }
board = Board.new(start_grid)

loop do
  table = Draw.draw_table(board.grid)
  puts table

  sleep(0.5)

  new_grid = board.check_each_cell_status
  new_board = Board.new(new_grid)
  board = new_board
  system 'clear' 
end

