
# frozen_string_literal: true

class Cell
  attr_accessor :is_on

  def initialize(is_on)
    @is_on = is_on
  end

  # implements rules for game for cells that are ON/living
  def check_on_cell(live_n)
    if live_n == 2 || live_n == 3
      true
    else
      false
    end
  end

  # implements rules for game for cells that are OFF/dead
  def check_off_cell(live_n)
    live_n == 3
  end
end
