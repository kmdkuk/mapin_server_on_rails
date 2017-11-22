class UploadedFilesController < ApplicationController
  def index
    if params[:shop_id]
      @shop = Shop.find(params[:shop_id])
      @files = @shop.uploaded_files
    else
      @files = UploadedFile.all
    end
    respond_to do |format|
      format.html
      format.json { render json: @files }
    end
  end

  def show
    @file = UploadedFile.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @file }
    end
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @file = @shop.uploaded_files.build
  end

  def create
    @shop = Shop.find(params[:shop_id])
    params[:uploaded_file][:file_type] = File.extname(params[:uploaded_file][:file].original_filename)
    params[:uploaded_file][:name] = params[:uploaded_file][:file].original_filename if params[:uploaded_file][:name].empty?
    params[:uploaded_file][:file_type].slice!(0)

    @file = @shop.uploaded_files.build(file_params)
    @file.name.slice!(".#{@file.file_type}")
    if @file.save!
      flash[:success] = "File add!"
      if @file.file? && @file.url.nil?
        @file.update_attribute(:url, file_download_url(@file))
      end
      redirect_to shop_files_url(@file.shop)
    else
      flash[:danger] = "File add fail..."
      render 'new'
    end
  end

  def edit
    @file = UploadedFile.find(params[:id])
  end

  def update
    @file = UploadedFile.find(params[:id])
    if @file.update_attributes(file_params)
      flash[:success] = "File data updated"
      redirect_to shop_files_url(@file.shop)
    else
      flash[:danger] = "Updated failed..."
      render 'edit'
    end
  end

  def destroy
    UploadedFile.find(params[:id]).destroy
    flash[:success] = "File deleted"
    redirect_to root_url
  end

  def download
    file = UploadedFile.find(params[:file_id])
    data = open(file.file.url)
    send_data data.read, filename: file.file_fullname, disposition: 'attachment', stream: 'true', buffer_size: '4096'
  end

  private
    def file_params
      params.require(:uploaded_file).permit(:name, :file_type , :file)
    end
end
