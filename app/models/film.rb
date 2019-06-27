class Film < ApplicationRecord
  has_and_belongs_to_many :characters, dependent: :destroy
  has_and_belongs_to_many :planets, dependent: :destroy
  has_and_belongs_to_many :starships
  # has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :species, dependent: :destroy

  def self.add_relationships!
    swapi = Swapi.new "films"

    Film.all.each do |film|
      # add many to many relationship with characters
      # characters = swapi.relationships film.id, key: "characters", attr: "people"
      # characters.each do |id|
      #   char = Character.find(id)
      #   film.characters << char
      # end

      # add many to may relationships with planets
      # planets = swapi.relationships film.id, key: "planets", attr: "planets"
      # planets.each do |id|
      #   planet = Planet.find(id)
      #   film.planets << planet
      # end

      # add many to may relationships with species
      # species = swapi.relationships film.id, key: "species", attr: "species"
      # species.each do |id|
      #   s = Species.find(id)
      #   film.species << s
      # end

      # add many to may relationships with starships
      starships = swapi.relationships film.id, key: "starships", attr: "starships"
      starships.each do |id|
        starship = Starship.find(id)
        film.starships << starship
      end
    end
  end

  def self.migrate!
    swapi   = Swapi.new "films"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Film).include?(k) }
      Film.create!(hash)
    end

    true
  end

  def self.clear_relationships!
    Film.all.each do |film|    
      film.characters.clear
    end
  end
end
