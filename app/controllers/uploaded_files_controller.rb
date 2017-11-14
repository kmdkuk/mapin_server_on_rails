class UploadedFilesController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:shop_id])
    @files = @shop.uploaded_files
    respond_to do |format|
      format.html
      format.json { render json: @files }
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
    params[:uploaded_file][:file_type] = File.extname(params[:uploaded_file][:file].original_filename)
    params[:uploaded_file][:name] = params[:uploaded_file][:file].original_filename if params[:uploaded_file][:name].empty?
    params[:uploaded_file][:file_type].slice!(0)

    @file = @shop.uploaded_files.build(file_params)
    @file.name.slice!(".#{@file.file_type}")
    if @file.save!
      flash[:success] = "File add!"
      if @file.file? && @file.url.nil?
        @file.update_attribute(:url, @file.file.url)
      end
      redirect_to company_shop_file_path(@company, @shop, @file)
    else
      flash[:danger] = "File add fail..."
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
      redirect_to company_shop_file_path(@company, @shop, @file)
    else
      flash[:danger] = "Updated failed..."
      render 'edit'
    end
  end

  def download
    file = UploadedFile.find(params[:file_id])
    file_path = Rails.root.join(file.file.path)
    stat = File::stat(file_path)
    send_file(file_path, filename: file.file_fullname, length: stat.size)
  end

  private
    def file_params
      params.require(:uploaded_file).permit(:name, :file_type , :file)
    end
end
