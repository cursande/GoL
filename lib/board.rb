# frozen_string_literal: true

require 'pry'
require_relative './cell.rb'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def check_each_cell_status
    # will check every cell in board, making it alive or dead based on neighbour count
    x, y = grid.length, grid[0].length
    row, col = 0, 0
    while row < x # IMPROVEMENT: a more 'ruby' way of doing this, something like each_with_index
      while col < y

        total_live_n = find_live_neighbours(row, col)

        if grid[row][col].is_on == true
          # if the cell is ON...
          grid[row][col].check_on_cell(total_live_n)
        else
          # if the cell is OFF...
          grid[row][col].check_off_cell(total_live_n)
        end

        col += 1
      end

      col = 0
      row += 1
    end

    # return the updated grid for the new board
    grid.map { |row| row.each(&:switch_cell_on?) }
  end

  private

  def find_live_neighbours(row, col)
    # count neighbours that are ON/alive
    total_live_n = 0

    # IMPROVEMENT: verbose, would be a more elegant way to scan neighbours
    total_live_n += check_vertical_cells(row, col)
    total_live_n += check_left_cells(row, col)
    total_live_n += check_right_cells(row, col)
  end

  def check_vertical_cells(row, col)
    live_n = 0

    if row > 0
      # check up
      live_n += 1 if grid[row - 1][col].is_on == true
    end

    if row < grid.length - 1
      # check down
      live_n += 1 if grid[row + 1][col].is_on == true
    end
    live_n
  end

  def check_left_cells(row, col)
    live_n = 0

    if col > 0
      # check left
      live_n += 1 if grid[row][col - 1].is_on == true

      if row > 0
        # check upper left
        live_n += 1 if grid[row - 1][col - 1].is_on == true
      end

      if row < grid.length - 1
        # check lower left
        live_n += 1 if grid[row + 1][col - 1].is_on == true
      end
    end
    live_n
  end

  def check_right_cells(row, col)
    live_n = 0

    if col < grid[0].length - 1
      # check right
      live_n += 1 if grid[row][col + 1].is_on == true

      if row > 0
        # check upper right
        live_n += 1 if grid[row - 1][col + 1].is_on == true
      end

      if row < grid.length - 1
        # check lower right
        live_n += 1 if grid[row + 1][col + 1].is_on == true
      end
    end
    live_n
  end

end
