class Api::ShopsController < ApplicationController
  def index
    if(params[:longitude].present? && params[:latitude].present?)
      long = params[:longitude].to_f
      lat = params[:latitude].to_f
      @shops = Shop.joins(:category, :company).select("shops.*, companies.name as company_name, categories.name as category_name").within(1, origin: [lat, long])
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
