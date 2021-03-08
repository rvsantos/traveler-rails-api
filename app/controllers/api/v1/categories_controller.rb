class Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [:update, :show, :destroy]
  before_action :all_categories, only: [:index, :create]

  def index
    json_response(@categories, :ok)
  end

  def create
    if @categories.count < 3
      @category = Category.new(set_params)
      json_response(@category, :created) if @category.save!
    else
      json_response({ errors: 'Category already have 3 itens' },
                    :unprocessable_entity)
    end
  end

  def update
    @category.update!(set_params)
    json_response(@category) if @category
  end

  def show
    json_response(@category)
  end

  def destroy
    @category.destroy!
    head 204
  end

  private

  def set_params
    params.permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def all_categories
    @categories = Category.all
  end
end
