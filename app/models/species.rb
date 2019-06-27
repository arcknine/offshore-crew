class Species < ApplicationRecord
  has_and_belongs_to_many :films, dependent: :destroy
  belongs_to :planet

  def self.migrate!
    swapi   = Swapi.new "species"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Species).include?(k) }
      hash["planet_id"] = result["homeworld"].nil? ? 1 : get_id('planets', result["homeworld"])
      Species.create!(hash)
    end

    true
  end
end
