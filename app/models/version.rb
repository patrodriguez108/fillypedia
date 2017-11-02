class Version < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  def self.search(search)
    drop_down_search = Version.all.select {|version| version.title == search}
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
