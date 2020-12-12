class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemsSerializer.format_items(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemsSerializer.format_item(item)
  end

  def create
    item = Item.create!(item_params)
    render json: ItemsSerializer.format_item(item)
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
