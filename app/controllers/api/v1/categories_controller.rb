class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    json_response(@categories, :ok)
  end

  def create
    @category = Category.new(set_params)
    json_response(@category, :created) if @category.save!
  end

  private

  def set_params
    params.permit(:name)
  end
end
