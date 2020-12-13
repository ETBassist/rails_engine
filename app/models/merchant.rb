class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.by_revenue(limit_num = 10)
    self.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group('merchants.id')
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
      .order('revenue DESC')
      .limit(limit_num)
  end
end

  # Merchant.joins(invoices: [:invoice_items, :transactions])
  # .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
  # .group('merchants.id')
  # .where("invoices.status = 'shipped' AND transactions.result = 'success'")

#  create_table "merchants", force: :cascade do |t|
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end
