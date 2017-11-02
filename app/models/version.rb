class Version < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates :title, :body, {presence: true}

  def self.search(search)
    all_articles = Article.where(is_published: true)
    p all_articles_versions = []
    all_articles.each {|article| all_articles_versions << Version.find(article.published_version_id)}

    drop_down_search = all_articles_versions.select {|version| version.title == search}
    p drop_down_search

    titles = drop_down_search.pluck(:title)

    if titles.include?(search)
      drop_down_search
    elsif search
      where('lower(title) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
