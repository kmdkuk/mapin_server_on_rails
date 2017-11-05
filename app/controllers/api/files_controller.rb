class Api::FilesController < ApplicationController
  def index
    if params[:longitude].present? && params[:latitude].present? && !params[:shop_id]
      longitude = params[:longitude].to_f
      latitude = params[:latitude].to_f
      shops = Shop.all
      shop_id_list = []
      shops.each do |shop|
        shop_longitude, shop_latitude = 0.0, 0.0
        shop_longitude = shop[:longitude].to_f
        shop_latitude = shop[:latitude].to_f
        if ((shop_longitude - longitude).abs > 0.01 || (shop_latitude - latitude).abs > 0.01)
          next
        end
        shop_id_list.push(shop[:id])
      end
      @files = UploadedFile.where shop_id: shop_id_list
    elsif params[:shop_id]
      @files = UploadedFile.where shop_id: params[:shop_id]
    else
      # @files = UploadedFile.all
    end
    render json: @files
  end

  def show
    @file = UploadedFile.find(params[:id])
    render json: @file
  end
end
