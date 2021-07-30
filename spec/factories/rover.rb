FactoryBot.define do
  factory :rover do
    id             {1}
    name           {'Jason'}
    org            {'NASA'}
    x_axis         {0}
    y_axis         {0}
    direction      {'N'}
    plateau_x_axis {5}
    plateau_y_axis {5}
  end
end