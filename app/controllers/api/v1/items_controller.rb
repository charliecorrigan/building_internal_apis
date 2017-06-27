class Api::V1::ItemsController < ApplicationController
  def index
    # render json: Item.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end
  
  private

    def item_params
      params.permit(:name, :description)
    end
end