class Api::V1::MerchantsSearchController < ApplicationController
  def show
    merchant = Merchant.where('lower(name) like ?', "%#{params[:name].downcase}%").first
    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.where('lower(name) like ?', "%#{params[:name].downcase}%")
    render json: MerchantSerializer.new(merchants)
  end

  def find_by_revenue
    render json: MerchantSerializer.new(Merchant.by_revenue(params[:quantity]))
  end

  def find_by_items
    render json: MerchantSerializer.new(Merchant.by_items_sold(params[:quantity]))
  end
end
