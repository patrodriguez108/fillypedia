class PagesController < ApplicationController
  def home
    version_ids = Article.where(is_published: true).order('created_at DESC').limit(3).pluck(:published_version_id)
    featured_article_version = Article.where(is_featured: true, is_published: true).first
    @featured_article = {title: Version.find(featured_article_version.published_version_id).title, image_url: featured_article_version.photo_url}

    @recent_articles = []
    version_ids.each {|id| @recent_articles << Version.find(id) }
    @categories = Category.all
  end

  def about

  end
end
