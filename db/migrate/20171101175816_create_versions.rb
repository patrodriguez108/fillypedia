class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :title
      t.text :body
      t.string :photo_url
      t.integer :article_id
      t.integer :author_id

      t.timestamps
    end
  end
end
