class PagesController < ApplicationController
  def home
    @recent_articles = Article.where(is_published: true).order('created_at DESC').limit(3).pluck(:published_version_id)
    @categories = Category.all
  end

  def about

  end
end
