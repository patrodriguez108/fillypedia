class Category < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :category_articles
  has_many :articles, through: :category_articles

end