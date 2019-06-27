class CreateJoinTableFilmsPlanets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :films, :planets do |t|
      t.index [:film_id, :planet_id]
      t.index [:planet_id, :film_id]
    end
  end
end
