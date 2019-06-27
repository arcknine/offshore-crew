class CreateJoinTableFilmsCharacters < ActiveRecord::Migration[5.2]
  def change
    create_join_table :films, :characters do |t|
      t.index [:film_id, :character_id]
      t.index [:character_id, :film_id]
    end
  end
end
