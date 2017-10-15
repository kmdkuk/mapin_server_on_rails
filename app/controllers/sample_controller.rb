require 'json'

class SampleController < ApplicationController
  def index
    filePath = "#{Rails.root}/sample.json"
    sample = []
    File.open(filePath) do |file|
      sample = JSON.load(file)
    end
    render json: JSON.pretty_generate(sample)
  end
end
