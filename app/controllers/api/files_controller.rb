class Api::FilesController < ApplicationController
  def index
    if params[:longitude].present? && params[:latitude].present? && !params[:shop_id]
      longitude = params[:longitude].to_f
      latitude = params[:latitude].to_f
      shops = Shop.select(:id).within(1,[latitude, longitude])
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
