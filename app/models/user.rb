class User < ApplicationRecord
  has_many :created_categories, class_name: "Category", foreign_key: :admin_id
  has_many :versions, foreign_key: :author_id
  has_many :articles, -> {distinct}, through: :versions

  has_secure_password

  validates :username, :email, { presence: true }
  validates :username, :email, uniqueness: { message: "The information you entered is invalid" }

  def published_versions
    published_articles.map { |article|
      Version.find(article.published_version_id)}
  end

  def published_articles
    self.articles.where(:is_published => true)
  end
end
