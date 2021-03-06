class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemSerializer.new(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item)
    else
      render status: :bad_request, body: item.errors.full_messages.to_sentence
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head :no_content
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item)
    else
      render status: :bad_request, body: item.errors.full_messages.to_sentence
    end
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
