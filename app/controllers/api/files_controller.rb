class Api::FilesController < ApplicationController
  def index
    longitude = params[:longitude].to_f
    latitude = params[:latitude].to_f
    if latitude.instance_of?(Float) && longitude.instance_of?(Float) && !params[:shop_id]
      shops = Shop.select(:id).within(1, origin: [latitude, longitude])
      @files = UploadedFile.where(shop_id: shops)
    elsif params[:shop_id]
      shops = Shop.find(params[:shop_id])
      @files = shops.uploaded_files
    else
      @files = UploadedFile.all
    end
    render json: @files
  end

  def show
    @file = UploadedFile.find(params[:id])
    render json: @file
  end
end
