class Vehicle < ApplicationRecord
  has_and_belongs_to_many :films, dependent: :destroy

  def self.migrate!
    swapi   = Swapi.new "vehicles"
    results = swapi.fetch

    results.each do |result|
      hash = result.select { |k,v| allowed_keys(Vehicle).include?(k) }
      Vehicle.create!(hash)
    end

    true
  end
end
