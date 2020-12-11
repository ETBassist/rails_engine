class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
end

#  create_table "merchants", force: :cascade do |t|
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end
