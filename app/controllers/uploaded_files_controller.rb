class UploadedFilesController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @files = @shop.uploaded_files
    respond_to do |format|
      format.html
      format.json { render json: @files}
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shop.uploaded_files.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @file }
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shop.uploaded_files.build
  end

  def create
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shop.uploaded_files.build(file_params)
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
    @file = @shop.uploaded_files.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @file = @shop.uploaded_files.find(params[:id])
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
      params.require(:uploaded_file).permit(:name, :url, :file_type)
    end
end
