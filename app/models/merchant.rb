class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.by_revenue(num_merchants = 10)
    self.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group(:id)
      .where(invoices: {status: 'shipped'}) 
      .where(transactions: {result: 'success'})
      .order('revenue DESC')
      .limit(num_merchants)
  end

  def self.revenue_between(date1, date2)
    date_range = (date1.to_datetime.beginning_of_day..date2.to_datetime.end_of_day)
    self.joins(invoices: [:invoice_items, :transactions])
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
      .where(invoices: {created_at: date_range})
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end

      #.where("invoices.status = 'shipped' AND transactions.result = 'success'")
  def self.by_items_sold(num_merchants = 10)
    self.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity) AS items_sold')
      .group(:id)
      .where(invoices: {status: 'shipped'}) 
      .where(transactions: {result: 'success'})
      .order('items_sold DESC')
      .limit(num_merchants)
  end

  def revenue
    invoices.joins(:invoice_items, :transactions)
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end

#  create_table "merchants", force: :cascade do |t|
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end
