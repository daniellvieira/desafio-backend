# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_16_133255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "parlamentarian_id", null: false
    t.date "date_issue"
    t.string "provider"
    t.decimal "value", precision: 10, scale: 2
    t.text "url_document"
    t.string "id_document"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "num_sub_quota"
    t.string "desc_sub_quota"
    t.string "num_spec_sub_quota"
    t.string "desc_spec_sub_quota"
    t.string "cpf_cnpj"
    t.string "num_document"
    t.string "type_document"
    t.string "value_document"
    t.string "value_gloss"
    t.string "month"
    t.string "year"
    t.string "num_portion"
    t.string "passenger"
    t.string "stretch"
    t.string "num_lot"
    t.string "num_reimbursement"
    t.string "value_refund"
    t.string "num_parlamentarian"
    t.index ["parlamentarian_id"], name: "index_expenses_on_parlamentarian_id"
  end

  create_table "file_histories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.string "message"
  end

  create_table "parlamentarians", force: :cascade do |t|
    t.string "name"
    t.string "id_register"
    t.string "num_portfolio"
    t.string "num_legislature"
    t.string "uf"
    t.string "political_party"
    t.string "cod_legislature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total", precision: 10, scale: 2
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "expenses", "parlamentarians"
end
