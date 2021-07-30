class Rover < ApplicationRecord

  def crashed?
    (0..plateau_y_axis).include?(y_axis) && (0..plateau_x_axis).include?(x_axis)
  end
end
