class Article < ApplicationRecord
  has_many :versions, dependent: :destroy
  has_many :category_articles
  has_many :categories, through: :category_articles

  def published_version
    Version.find_by(id: self.published_version_id)
  end


  def self.is_published
    where(is_published: true)
  end

  def self.most_clicked_article
    article_all = Article.is_published.order(click_count: :desc).first
  end

  def self.drop_title
    versions = []
    Article.all.each {|article| versions << article.published_version if article.is_published}
    versions.pluck(:title)
  end

  def self.drop_version
    versions = []
    Article.all.each {|article| versions << article.published_version if article.is_published}
    versions
  end
end
