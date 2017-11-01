require 'json'
require "open-uri"

class SampleController < ApplicationController
  def index
    filePath = "#{Rails.root}/sample.json"
    sample = []
    sample = open("https://raw.githubusercontent.com/miraikeitai2017/mapin-All/master/Json-Sample/sample.json?token=APLozRHpn2H4NjTgMCaI1OZtoryPXkN_ks5Z8CpDwA%3D%3D", &:read)
    File.open(filePath) do |file|
      # sample = JSON.load(file)
    end
    render json: sample
  end
end
