class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.string :vehicle_class
      t.string :manufacturer
      t.string :length
      t.string :cost_in_credits
      t.string :crew
      t.string :max_atmosphering_speed
      t.string :cargo_capacity
      t.string :consumables

      t.timestamps
    end
  end
end
