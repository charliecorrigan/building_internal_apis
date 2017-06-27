class Api::V1::OrdersController < ApplicationController
  def index
    @orders = Order.all
    # render json: Order.all
  end

  def show
    # render json: Order.find(params[:id])
    @order = Order.find(params[:id])
  end

end