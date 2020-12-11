class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
end

#  create_table "items", force: :cascade do |t|
#    t.string "name"
#    t.text "description"
#    t.float "unit_price"
#    t.bigint "merchant_id"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.index ["merchant_id"], name: "index_items_on_merchant_id"
#  end
