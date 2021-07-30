class CreateRovers < ActiveRecord::Migration[5.2]
  def change
    create_table :rovers do |t|
      t.string :name
      t.string :org
      t.integer :x_axis , :default => 0
      t.integer :y_axis , :default => 0
      t.string :direction , :default => "N"
      t.integer :plateau_x_axis 
      t.integer :plateau_y_axis 

      t.timestamps
    end
  end
end
