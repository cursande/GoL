
# frozen_string_literal: true

class Cell
  attr_accessor :is_on, :will_be_on

  def initialize(is_on)
    @is_on = is_on
    @will_be_on = false
  end

  # implements rules for game for cells that are ON/living
  def check_on_cell(live_n)
    if (live_n == 2) || (live_n == 3)
      self.will_be_on = true
    else
      self.will_be_on = false
    end
  end

  # implements rules for game for cells that are OFF/dead
  def check_off_cell(live_n)
    self.will_be_on = live_n == 3
  end

  def switch_cell_on?
    self.is_on = will_be_on == true
  end
end
