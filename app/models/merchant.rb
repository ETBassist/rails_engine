class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.by_revenue(num_merchants = 10)
    self.joins(invoices: [:invoice_items, :transactions])
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .group('merchants.id')
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
      .order('revenue DESC')
      .limit(num_merchants)
  end

  # TODO figure out some way to return just the number instead of an array
  def self.revenue_between(date1, date2)
    self.joins(invoices: [:invoice_items, :transactions])
      .group('merchants.id')
      .where("invoices.status = 'shipped' AND transactions.result = 'success' AND invoices.created_at > '#{date1}' AND invoices.created_at < '#{date2}'")
      .pluck(Arel.sql('SUM(invoice_items.quantity * invoice_items.unit_price)'))
  end

  def revenue
    invoices.joins(:invoice_items, :transactions)
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end

#SELECT SUM(revenue) FROM (SELECT SUM(ii.quantity * ii.unit_price) AS revenue FROM merchants m
#INNER JOIN invoices i ON i.merchant_id = m.id
#INNER JOIN invoice_items ii ON i.id = ii.invoice_id
#INNER JOIN transactions t ON t.id = t.invoice_id
#WHERE i.status = 'shipped' AND t.result = 'success' AND i.created_at > '2012-03-12' AND i.created_at < '2012-03-14'
#GROUP BY m.id) AS total_revenue;

#  create_table "merchants", force: :cascade do |t|
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end
