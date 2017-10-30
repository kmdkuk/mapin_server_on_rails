class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    # company/<company_id>/shop で表示するべきかも
    # @shops = @company.shops
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company Add!"
      redirect_to @company
    else
      flash[:danger] = "Company Add fail...."
      render 'new'
    end
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Company data updated"
      redirect_to @company
    else
      flash[:danger] = "Update failed..."
      render 'edit'
    end
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end
end
