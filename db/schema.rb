# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_27_052101) do

  create_table "characters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "eye_color"
    t.string "gender"
    t.string "hair_color"
    t.string "height"
    t.string "mass"
    t.string "skin_color"
    t.bigint "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_characters_on_planet_id"
  end

  create_table "characters_films", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "character_id", null: false
    t.index ["character_id", "film_id"], name: "index_characters_films_on_character_id_and_film_id"
    t.index ["film_id", "character_id"], name: "index_characters_films_on_film_id_and_character_id"
  end

  create_table "films", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.text "opening_crawl"
    t.string "director"
    t.string "producer"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films_planets", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "planet_id", null: false
    t.index ["film_id", "planet_id"], name: "index_films_planets_on_film_id_and_planet_id"
    t.index ["planet_id", "film_id"], name: "index_films_planets_on_planet_id_and_film_id"
  end

  create_table "films_species", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "species_id", null: false
    t.index ["film_id", "species_id"], name: "index_films_species_on_film_id_and_species_id"
    t.index ["species_id", "film_id"], name: "index_films_species_on_species_id_and_film_id"
  end

  create_table "films_starships", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "starship_id", null: false
    t.index ["film_id", "starship_id"], name: "index_films_starships_on_film_id_and_starship_id"
    t.index ["starship_id", "film_id"], name: "index_films_starships_on_starship_id_and_film_id"
  end

  create_table "films_vehicles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "vehicle_id", null: false
    t.index ["film_id", "vehicle_id"], name: "index_films_vehicles_on_film_id_and_vehicle_id"
    t.index ["vehicle_id", "film_id"], name: "index_films_vehicles_on_vehicle_id_and_film_id"
  end

  create_table "planets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "diameter"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "gravity"
    t.string "population"
    t.string "climate"
    t.string "terrain"
    t.string "surface_water"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "eye_colors"
    t.string "hair_colors"
    t.string "skin_colors"
    t.string "language"
    t.bigint "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_species_on_planet_id"
  end

  create_table "starships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "starship_class"
    t.string "manufacturer"
    t.string "cost_in_credits"
    t.string "length"
    t.string "crew"
    t.string "passengers"
    t.string "max_atmosphering_speed"
    t.string "hyperdrive_rating"
    t.string "mglt"
    t.string "cargo_capacity"
    t.string "consumables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "vehicle_class"
    t.string "manufacturer"
    t.string "length"
    t.string "cost_in_credits"
    t.string "crew"
    t.string "max_atmosphering_speed"
    t.string "cargo_capacity"
    t.string "consumables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
