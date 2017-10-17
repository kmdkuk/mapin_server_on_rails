require 'json'
class UploadedFilesController < ApplicationController
  def index
    companies = Company.all
    result = companies.to_json(include: {shops: {include: [:uploaded_files]}})
    render json: result
  end

end
