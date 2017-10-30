class ShopsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shops = @company.shops
  end

  def show
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @shop = @company.shops.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
