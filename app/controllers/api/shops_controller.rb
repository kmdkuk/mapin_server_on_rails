class Api::ShopsController < ApplicationController
  def index
    @shops = Shop.joins(:category).select("shops.*, categories.name as category_name").all
    render json: @shops
  end

  def show
    @shop = Shop.joins(:category).select("shops.*, categories.name as category_name").find(params[:id])
    render json: @shop
  end
end
