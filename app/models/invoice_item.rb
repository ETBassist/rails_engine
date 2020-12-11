class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
end

#  create_table "invoice_items", force: :cascade do |t|
#    t.bigint "item_id"
#    t.bigint "invoice_id"
#    t.integer "quantity"
#    t.float "unit_price"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
#    t.index ["item_id"], name: "index_invoice_items_on_item_id"
#  end
