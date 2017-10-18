require 'json'
class UploadedFilesController < ApplicationController
  def index
    companies = Company.all
    result = companies.to_json(include: {shops: {include: [:uploaded_files]}})
    render text: JSON.load(result)
  end

end
