# frozen_string_literal: true

require 'terminal-table'

class Draw
  def self.draw_table(grid)
    table = Terminal::Table.new
    grid.each do |row|
      printed_row = row.map { |cell| cell.is_on ? 'O' : '.' }
      table.add_row(printed_row)
    end
    table
  end
end
