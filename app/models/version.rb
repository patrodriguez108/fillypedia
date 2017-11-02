class Version < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates :title, :body, {presence: true}

  def self.search(search)
    all_articles = Article.drop_version
    result = []
    all_articles.each {|version| result << version if version.title == search}
    titles = Article.drop_title
    if titles.include?(search)
      result
    elsif search
      versions = where('lower(title) LIKE ?', "%#{search}%")
      all_versions_collected = []
      versions.each {|version| all_versions << version if version.article.is_published }
      all_versions_collected
    end
  end
end
