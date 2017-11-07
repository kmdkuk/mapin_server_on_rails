class Api::ShopsController < ApplicationController
  def index
    if(params[:longitude].present? && params[:latitude].present?)
      long = params[:longitude].to_f
      lat = params[:latitude].to_f
      @shops = Shop.joins(:category, :company).select("shops.*, companies.name as company_name, categories.name as category_name").where(longitude: (long-0.01)..(long+0.01), latitude: (lat-0.01)..(lat+0.01))
    else
      @shops = Shop.joins(:category, :company).select("shops.*, companies.name as company_name, categories.name as category_name").all
    end
    render json: @shops
  end

  def show
    @shop = Shop.joins(:category, :company).select("shops.*, companies.name as company_name, categories.name as category_name").find(params[:id])
    render json: @shop
  end
end
