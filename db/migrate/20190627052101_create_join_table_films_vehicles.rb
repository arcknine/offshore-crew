class CreateJoinTableFilmsVehicles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :films, :vehicles do |t|
      t.index [:film_id, :vehicle_id]
      t.index [:vehicle_id, :film_id]
    end
  end
end
