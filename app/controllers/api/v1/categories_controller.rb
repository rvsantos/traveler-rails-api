class Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [:update, :show]

  def index
    @categories = Category.all
    json_response(@categories, :ok)
  end

  def create
    @category = Category.new(set_params)
    json_response(@category, :created) if @category.save!
  end

  def update
    @category.update!(set_params)
    json_response(@category) if @category
  end

  def show
    json_response(@category)
  end

  private

  def set_params
    params.permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
