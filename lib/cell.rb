
# frozen_string_literal: true

class Cell
  attr_accessor :is_on

  def initialize(is_on)
    @is_on = is_on
  end

  # implements game rules for each cell
  def toggle_cell_state(live_n)
    if is_on
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
