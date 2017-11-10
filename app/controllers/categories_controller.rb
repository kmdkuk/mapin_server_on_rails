class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category create!"
      redirect_to @category
    else
      flash[:danger] = "Category create fail..."
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "category updated!"
      redirect_to @category
    else
      flash[:danger] = "category update fail..."
      render 'edit'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
