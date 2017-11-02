class Version < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  def self.search(search)
    all_articles = Article.where(is_published: true)
    all_articles.map {|article| Version.find(article.published_version_id)}
    drop_down_search = all_articles.select {|version| version.title == search}
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
