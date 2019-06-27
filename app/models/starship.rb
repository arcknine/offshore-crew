class Starship < ApplicationRecord
  has_and_belongs_to_many :films, dependent: :destroy

  def self.migrate!
    swapi   = Swapi.new "starships"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Starship).include?(k) }
      Starship.create!(hash)
    end

    true
  end
end
