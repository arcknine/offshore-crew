class Planet < ApplicationRecord
  has_and_belongs_to_many :films, dependent: :destroy

  def self.migrate!
    swapi   = Swapi.new "planets"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Planet).include?(k) }
      Planet.create!(hash)
    end

    true
  end
end
