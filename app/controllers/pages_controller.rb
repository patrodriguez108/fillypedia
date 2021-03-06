class PagesController < ApplicationController
  def home
    version_ids = Article.where(is_published: true).order('created_at DESC').limit(3).pluck(:published_version_id)
    @recent_articles = []
    version_ids.each {|id| @recent_articles << Version.find(id) }

    @categories = Category.all

    @featured_article_id = Article.most_clicked_article.published_version_id
    @featured_article = Version.find(@featured_article_id)
  end

  def about

  end
end
