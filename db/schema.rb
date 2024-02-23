# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_23_133704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atleta", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competicaos", force: :cascade do |t|
    t.string "nome"
    t.boolean "finalizada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resultado_competicaos", force: :cascade do |t|
    t.bigint "atleta_id", null: false
    t.bigint "competicao_id", null: false
    t.bigint "resultado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atleta_id"], name: "index_resultado_competicaos_on_atleta_id"
    t.index ["competicao_id"], name: "index_resultado_competicaos_on_competicao_id"
    t.index ["resultado_id"], name: "index_resultado_competicaos_on_resultado_id"
  end

  create_table "resultados", force: :cascade do |t|
    t.decimal "valor"
    t.string "unidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "resultado_competicaos", "atleta", column: "atleta_id"
  add_foreign_key "resultado_competicaos", "competicaos"
  add_foreign_key "resultado_competicaos", "resultados"
end
