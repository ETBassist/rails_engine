class Api::V1::ItemsSearchController < ApplicationController
  def show
    item = Item.search_for_one(item_params)

    render json: ItemSerializer.new(item)
  end

  def index
    items = Item.search_for_many(item_params)

    render json: ItemSerializer.new(items)
  end

  private 

  def item_params
    params.permit(:name, :unit_price, :description, :merchant_id, :created_at, :update_at)
  end
end
