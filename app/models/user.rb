class User < ApplicationRecord
  has_many :created_categories, class_name: "Category", foreign_key: :admin_id
  has_many :versions, foreign_key: :author_id
  has_many :articles, through: :versions

  has_secure_password

end
