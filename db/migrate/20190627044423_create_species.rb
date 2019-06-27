class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :average_height
      t.string :average_lifespan
      t.string :eye_colors
      t.string :hair_colors
      t.string :skin_colors
      t.string :language
      t.references :planet

      t.timestamps
    end
  end
end
