class ShopsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    if(params[:longitude].present? && params[:latitude].present?)
      long = params[:longitude].to_f
      lat = params[:latitude].to_f
      @shops = @company.shops.where(longitude: (long-0.01)..(long+0.01), latitude: (lat-0.01)..(lat+0.01))
    else
      @shops = @company.shops
    end
    respond_to do |format|
      format.html
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @shop }
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @shop = @company.shops.build
  end

  def create
    @company = Company.find(params[:company_id])
    @shop = @company.shops.build(shop_params)
    if @shop.save
      flash[:success] = "Shop add!"
      redirect_to company_shops_url(@shop.company)
    else
      flash[:danger] = "shop add fail..."
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    @categories = Category.all
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "Shop data updated"
      redirect_to company_shops_url(@shop.company)
    else
      flash[:danger] = "Update failed..."
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:success] = "Shop deleted"
    redirect_to root_url
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :image_url, :postal_code,
                                   :address, :tel, :business_hours, :homepage, :category_id)
    end
end
