class CompanyController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    # company/<company_id>/shop で表示するべきかも
    # @shops = @company.shops
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end
end
