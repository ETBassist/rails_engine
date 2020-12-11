class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
end

#  create_table "invoices", force: :cascade do |t|
#    t.bigint "customer_id"
#    t.bigint "merchant_id"
#    t.string "status"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.index ["customer_id"], name: "index_invoices_on_customer_id"
#    t.index ["merchant_id"], name: "index_invoices_on_merchant_id"
#  end
