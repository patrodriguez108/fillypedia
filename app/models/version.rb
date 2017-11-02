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
      matching_ids = versions.map { |version| version.article_id }
      unique_article_ids = matching_ids.uniq
      unique_article_ids.map { |article_id| Article.find(article_id).published_version }
    end
  end
end
