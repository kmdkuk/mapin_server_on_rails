class ShopsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shops = @company.shops
  end
end
