class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.by_revenue(num_merchants = 10)
    self.joins(invoices: :invoice_items)
      .merge(Invoice.successful)
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group(:id)
      .order('revenue DESC')
      .limit(num_merchants)
  end

  def self.revenue_between(date1, date2)
    self.joins(invoices: :invoice_items)
      .merge(Invoice.successful)
      .merge(Invoice.created_between(date1, date2))
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.by_items_sold(num_merchants = 10)
    self.joins(invoices: :invoice_items)
      .merge(Invoice.successful)
      .select('merchants.*, SUM(invoice_items.quantity) AS items_sold')
      .group(:id)
      .order('items_sold DESC')
      .limit(num_merchants)
  end

  def revenue
    invoices.joins(:invoice_items)
      .merge(Invoice.successful)
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end

#  create_table "merchants", force: :cascade do |t|
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end
