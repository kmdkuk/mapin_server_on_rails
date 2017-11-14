class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @companies } # URLが.jsonの場合、@products.to_json が返される
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company Add!"
      redirect_to @company
    else
      flash[:danger] = "Company Add fail...."
      render 'new'
    end
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Company data updated"
      redirect_to @company
    else
      flash[:danger] = "Update failed..."
      render 'edit'
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = "Company deleted"
    redirect_to companies_url
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end
end
