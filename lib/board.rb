# frozen_string_literal: true

require_relative './cell.rb'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def check_each_cell_status
    # will check every cell in board, making it alive or dead based on neighbour count
    rows = grid.row_count
    cols = grid.column_count
    Matrix.build(rows, cols) { |row, col| Cell.new(find_live_neighbours(row, col)) }
  end

  private

  def find_live_neighbours(row, col)
    # count neighbours that are ON/alive
    cell = grid[row, col]
    live_n = 0

    neighbours = [
      [row - 1, col], # up
      [row + 1, col], # down
      [row - 1, col - 1], # up-left
      [row, col - 1], # left
      [row + 1, col - 1], # down-left
      [row - 1, col + 1], # up-right
      [row, col + 1], # right
      [row + 1, col + 1] # down-right
    ]

    neighbours.each { |row, col| live_n += count_valid_cell(row, col) }
    cell.toggle_cell_state(live_n)
  end

  def count_valid_cell(row, col)
    # Ensure cell being checked is in grid, return 1 if it's ON/alive
    if row == -1 || row == grid.row_count
      0
    elsif col == -1 || col == grid.column_count
      0
    elsif grid[row, col].is_on == false
      0
    else
      1
    end
  end
end
