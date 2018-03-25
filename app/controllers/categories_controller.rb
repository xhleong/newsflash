class CategoriesController < ApplicationController
  before_action :authorize
  before_action :check_admin

  def index
    @categories = Category.all
    @newcategory = Category.new
  end

  def create
    @newcategory = Category.new(category_params)
    @newcategory.save
    
    if @newcategory.save
      flash[:success] = "Added new category"
      redirect_to categories_path
    else
      flash[:error] = "Failed to create category"
      redirect_to categories_path
    end
    
  end

  def update
    @findcategory = Category.find(params[:id])

    if @findcategory.update
      flash[:success] = "Updated category"
      redirect_to categories_path
    else
      flash[:error] = "Failed to create category"
      redirect_to categories_path
    end
  end

  def destroy
    @findcategory = Category.find_by_id(params[:id])
    @findcategory.destroy

    if @findcategory.destroy
      flash[:success] = "Deleted category"
      redirect_to categories_path
    else
      flash[:error] = "Failed to create category"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name)
  end

end
