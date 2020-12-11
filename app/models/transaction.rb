class Transaction < ApplicationRecord
end

#  create_table "transactions", force: :cascade do |t|
#    t.bigint "invoice_id"
#    t.string "credit_card_number"
#    t.string "credit_card_expiration_date"
#    t.string "result"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
#  end
