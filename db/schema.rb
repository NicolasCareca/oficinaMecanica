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

ActiveRecord::Schema[7.1].define(version: 2023_12_23_232514) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.string "rg"
    t.string "email"
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.string "Mecanicos"
    t.string "descricao"
  end

  create_table "mecanicos", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipe_id", null: false
    t.string "telefone"
    t.string "email"
    t.index ["equipe_id"], name: "index_mecanicos_on_equipe_id"
  end

  create_table "ordem_de_servicos", force: :cascade do |t|
    t.integer "veiculo_id", null: false
    t.integer "servico_id", null: false
    t.integer "equipe_id", null: false
    t.integer "mecanico_id", null: false
    t.integer "peca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_ordem_de_servicos_on_equipe_id"
    t.index ["mecanico_id"], name: "index_ordem_de_servicos_on_mecanico_id"
    t.index ["peca_id"], name: "index_ordem_de_servicos_on_peca_id"
    t.index ["servico_id"], name: "index_ordem_de_servicos_on_servico_id"
    t.index ["veiculo_id"], name: "index_ordem_de_servicos_on_veiculo_id"
  end

  create_table "ordem_servico_items", force: :cascade do |t|
    t.integer "ordem_servico_id", null: false
    t.bigint "servico_id"
    t.bigint "peca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ordem_servico_id"], name: "index_ordem_servico_items_on_ordem_servico_id"
    t.index ["peca_id"], name: "index_ordem_servico_items_on_peca_id"
    t.index ["servico_id"], name: "index_ordem_servico_items_on_servico_id"
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.integer "numero"
    t.date "data_emissao"
    t.decimal "valor"
    t.date "data_conclusao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "veiculo_id", null: false
    t.integer "servico_id", null: false
    t.integer "peca_id"
    t.integer "equipe_id", null: false
    t.text "problema"
    t.text "problema_veiculo"
    t.string "status"
    t.index ["equipe_id"], name: "index_ordem_servicos_on_equipe_id"
    t.index ["peca_id"], name: "index_ordem_servicos_on_peca_id"
    t.index ["servico_id"], name: "index_ordem_servicos_on_servico_id"
    t.index ["veiculo_id"], name: "index_ordem_servicos_on_veiculo_id"
  end

  create_table "ordem_servicos_pecas", force: :cascade do |t|
    t.integer "ordem_servico_id", null: false
    t.integer "peca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ordem_servico_id"], name: "index_ordem_servicos_pecas_on_ordem_servico_id"
    t.index ["peca_id"], name: "index_ordem_servicos_pecas_on_peca_id"
  end

  create_table "pecas", force: :cascade do |t|
    t.string "descricao"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.decimal "preco"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "modelo"
    t.string "cor"
    t.integer "cliente_id"
    t.integer "ano"
  end

  add_foreign_key "mecanicos", "equipes"
  add_foreign_key "ordem_de_servicos", "equipes"
  add_foreign_key "ordem_de_servicos", "mecanicos"
  add_foreign_key "ordem_de_servicos", "pecas"
  add_foreign_key "ordem_de_servicos", "servicos"
  add_foreign_key "ordem_de_servicos", "veiculos"
  add_foreign_key "ordem_servico_items", "ordem_servicos"
  add_foreign_key "ordem_servico_items", "pecas"
  add_foreign_key "ordem_servico_items", "servicos"
  add_foreign_key "ordem_servicos", "equipes"
  add_foreign_key "ordem_servicos", "pecas"
  add_foreign_key "ordem_servicos", "servicos"
  add_foreign_key "ordem_servicos", "veiculos"
  add_foreign_key "ordem_servicos_pecas", "ordem_servicos"
  add_foreign_key "ordem_servicos_pecas", "pecas"
end
