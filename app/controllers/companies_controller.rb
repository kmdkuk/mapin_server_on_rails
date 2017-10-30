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
  end

  def update
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end
end
