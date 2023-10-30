class Admin::CategoriesController < ApplicationController

  # admin authentification, name and password are set in .env
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"]
  
  # Retrive and list all categories
  def index
    @categories = Category.order(:id).all
  end

  # Create a new category object for the 'new' action
  def new
    @category = Category.new
  end

  # Create a new category using submitted parameters
  # Redirect to the admin categories if successful, or re-render 'new' if not
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  # Define the category parameter for creating 
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
