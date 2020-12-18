class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
  end

  def create
    merchant = Merchant.new(merchant_params)
    if merchant.save
      render json: MerchantSerializer.new(merchant)
    else
      render status: :bad_request, body: merchant.errors.full_messages.to_sentence
    end
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
    head :no_content
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    render json: MerchantSerializer.new(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
