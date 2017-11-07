class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def range? shop_lat, shop_long, client_lat, client_long
    (shop_lat - client_lat).abs < 0.01 && (shop_long - client_long).abs < 0.01
  end
end
