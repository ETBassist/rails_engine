class Api::V1::ItemsSearchController < ApplicationController
  def show
    item = Item.search_by(item_params)

    if item
      render json: ItemSerializer.new(item.first)
    else
      head :no_content
    end
  end

  def index
    items = Item.search_by(item_params)

    if items.empty?
      head :no_content
    else
      render json: ItemSerializer.new(items)
    end
  end

  private 

  def item_params
    params.permit(:name, :unit_price, :description, :merchant_id, :created_at, :update_at)
  end
end
