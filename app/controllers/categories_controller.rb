class CategoriesController < ApplicationController
  def about

  end

  def show
    @category = Category.find(params[:id])
    @articles = []
    @category.articles.each do |article|
      @articles << article.published_version unless article.published_version == nil
    end
  end
end
