class Version < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  def self.search(search)
    if search
      where('lower(title) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
