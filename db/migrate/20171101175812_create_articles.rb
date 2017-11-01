class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.boolean :published, default: false
      t.string :photo_url
      t.integer :click_count
      t.integer :published_version_id

      t.timestamps
    end
  end
end
