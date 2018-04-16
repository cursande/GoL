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
    total_live_n = 0

    # TODO: would be much cleaner ways to scan neighbours by separating counting neighbours + checking if it's a valid neighbour
    total_live_n += check_vertical_cells(row, col)
    total_live_n += check_left_cells(row, col)
    total_live_n += check_right_cells(row, col)

    cell.is_on ? cell.check_on_cell(total_live_n) : cell.check_off_cell(total_live_n)
  end

  def check_vertical_cells(row, col)
    live_n = 0

    if row > 0
      # check up
      live_n += 1 if grid[row - 1, col].is_on == true
    end

    if row < grid.row_count - 1
      # check down
      live_n += 1 if grid[row + 1, col].is_on == true
    end
    live_n
  end

  def check_left_cells(row, col)
    live_n = 0

    if col > 0
      # check left
      live_n += 1 if grid[row, col - 1].is_on == true

      if row > 0
        # check upper left
        live_n += 1 if grid[row - 1, col - 1].is_on == true
      end

      if row < grid.row_count - 1
        # check lower left
        live_n += 1 if grid[row + 1, col - 1].is_on == true
      end
    end
    live_n
  end

  def check_right_cells(row, col)
    live_n = 0

    if col < grid.column_count - 1
      # check right
      live_n += 1 if grid[row, col + 1].is_on == true

      if row > 0
        # check upper right
        live_n += 1 if grid[row - 1, col + 1].is_on == true
      end

      if row < grid.row_count - 1
        # check lower right
        live_n += 1 if grid[row + 1, col + 1].is_on == true
      end
    end
    live_n
  end
end
