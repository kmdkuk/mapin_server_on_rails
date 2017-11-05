class ShopsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @shops = @company.shops
    respond_to do |format|
      format.html
      format.json { render json: @shops }
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @shop }
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @shop = @company.shops.build
  end

  def create
    @company = Company.find(params[:company_id])
    @shop = @company.shops.build(shop_params)
    if @shop.save
      flash[:success] = "Shop add!"
      redirect_to [@company, @shop]
    else
      flash[:danger] = "Company add fail..."
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @shop = @company.shops.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "Shop data updated"
      redirect_to [@company, @shop]
    else
      flash[:danger] = "Update failed..."
      render 'edit'
    end
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :image_url, :postal_code,
                                   :address, :tel, :hours_begin, :hours_end,
                                   :longitude, :latitude)
    end
end
