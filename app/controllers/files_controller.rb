require 'json'
class FilesController < ApplicationController
  def index
    longitude = params[:longitude].to_f
    latitude = params[:latitude].to_f
    geocodeFlag = false
    geocodeFlag = true if params[:longitude].present? && params[:latitude].present?
    companies = Company.all
    result = {status: "200", longitude: longitude, latitude: latitude, flag: geocodeFlag, companies: []}
    companies.each_with_index do |company, i|
      result[:companies].push({info: company})
      result[:companies][i][:shops] = []
      shops = company.shops.all
      shops.each_with_index do |shop, j|
        if geocodeFlag then
          shop_longitude = 0.0
          shop_latitude = 0.0
          shop_longitude = shop[:longitude]
          shop_latitude = shop[:latitude]
          if ((shop_longitude - longitude).abs > 0.01 && (shop_latitude - latitude).abs > 0.01)
            next
          end
        end
        shop_json = shop.to_json
        shop_hash = JSON.parse(shop_json)
        result[:companies][i][:shops].push({info: shop_hash})
        category = Category.find(shop[:category_id])
        result[:companies][i][:shops][j][:info][:category] = category[:name]
        result[:companies][i][:shops][j][:files] = []
        files = shop.uploaded_files.all
        files.each_with_index do |file, k|
          result[:companies][i][:shops][j][:files].push(file)
        end
      end
      result[:companies][i] = nil if result[:companies][i][:shops].empty?
    end
    result[:companies].compact!
    render json: result
  end
end
