require 'json'
require "open-uri"

class SampleController < ApplicationController
  def index
    filePath = "#{Rails.root}/sample.json"
    sample = []
    # githubにあるjsonサンプルがprivateだからかtokenが有効切れるのでだめだった
    # sample = open("https://github.com/miraikeitai2017/mapin-All/raw/master/Json-Sample/sample.json", &:read)
    File.open(filePath) do |file|
      sample = JSON.load(file)
    end
    render json: sample
  end
end
