class ShopController < ApplicationController
  def index
    @shops = Company.find(params[:company_id]).shops
  end
end
