class Admin::DashboardController < ApplicationController

  # admin authentification, name and password are set in .env
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"]

  # method to retrive data from the database
  # will pass the data to admin/dashboard/show.html/erb
  def show
    # set all the products to @products variable
    @products = Product.all

    # set all the categories to @categories valiable
    @categories = Category.all
  end
end
