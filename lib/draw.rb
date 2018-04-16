# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

class Draw
  def self.draw_table(grid)
    table = Terminal::Table.new
    grid.column_vectors.each do |row|
      printed_row = row.map { |cell| cell.is_on ? '■'.colorize(:red) : '-' }
      table.add_row(printed_row)
    end
    table
  end
end
