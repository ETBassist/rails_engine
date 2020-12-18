class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :created_between, -> (date1, date2)  {
    where(created_at: date1.to_date.beginning_of_day..date2.to_date.end_of_day) 
  }

  scope :successful, -> {
    joins(:transactions).where("invoices.status = 'shipped' AND transactions.result = 'success'") 
  }
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
