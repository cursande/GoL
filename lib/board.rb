# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  # will check every cell in board, making it alive or dead based on neighbour count
  def check_each_cell_status
    rows = grid.row_count
    cols = grid.column_count
    Matrix.build(rows, cols) { |row, col| find_live_neighbours(row, col) }
  end

  private

  # count neighbours that are ON/alive
  def find_live_neighbours(row, col)
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
    toggle_cell_state(cell, live_n)
  end

  # Ensure cell being checked is in grid, return 1 if it's ON/alive
  def count_valid_cell(row, col)
    if row == -1 || row == grid.row_count
      0
    elsif col == -1 || col == grid.column_count
      0
    elsif !grid[row, col]
      0
    else
      1
    end
  end

  # implements game rules for a given cell
  def toggle_cell_state(cell, live_n)
    if cell
      if live_n == 2 || live_n == 3
        true
      else
        false
      end
    else
      live_n == 3
    end
  end

end
