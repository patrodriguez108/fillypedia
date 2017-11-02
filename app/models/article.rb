class Article < ApplicationRecord
  has_many :versions
  has_many :category_articles
  has_many :categories, through: :category_articles
end
