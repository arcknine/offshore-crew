class CreateJoinTableFilmsStarships < ActiveRecord::Migration[5.2]
  def change
    create_join_table :films, :starships do |t|
      t.index [:film_id, :starship_id]
      t.index [:starship_id, :film_id]
    end
  end
end
