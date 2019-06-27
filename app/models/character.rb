class Character < ApplicationRecord
  has_and_belongs_to_many :films, dependent: :destroy
  belongs_to :planet

  # def self.add_relationships!
  #   swapi = Swapi.new "people"

  #   Character.all.each do |character|
  #     # add many to many relationship with characters
  #     films = swapi.relationships character.id, key: "films", attr: "films"
  #     films.each do |id|
  #       film = Film.find(id)
  #       character.films << film
  #     end

  #     #
  #   end
  # end

  def self.migrate!
    swapi   = Swapi.new "people"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Character).include?(k) }
      hash["planet_id"] = get_id('planets', result["homeworld"])
      Character.create!(hash)
    end

    true
  end

  # def self.clear_relationships!
  #   Character.all.each do |character|
  #     character.films.clear
  #   end
  # end
end
