class FilesController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @files = @shops.files
  end

  def show
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shops.files.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shops.files.build
  end

  def create
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shops.files.build(file_params)
    if @file.save
      flash[:success] = "Shop add!"
      redirect_to [@company, @shop, @file]
    else
      flash[:danger] = "Company add fail..."
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shops.files.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shops.files.find(params[:id])
    if @file.update_attributes(file_params)
      flash[:success] = "File data updated"
      redirect_to [@company, @shop, @file]
    else
      flash[:danger] = "Updated failed..."
      render 'edit'
    end
  end

  private
    def file_params
      params.require(:file).permit()
end
