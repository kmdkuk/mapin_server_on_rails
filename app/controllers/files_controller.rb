require 'json'
class FilesController < ApplicationController
  def index
    companies = Company.all
    result = {status: "200", companies: []}
    companies.each_with_index do |company, i|
      result[:companies].push({info: company})
      result[:companies][i][:shops] = []
      shops = company.shops.all
      shops.each_with_index do |shop, j|
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
    end
    render json: result
  end
end
