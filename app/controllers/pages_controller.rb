class PagesController < ApplicationController
  def home
    @recent_articles = Article.all.order('created_at DESC LIMIT 3')
    @categories = Category.all
  end

  def about

  end
end
