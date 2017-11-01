class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.boolean :is_published, default: false
      t.integer :click_count, default: 0
      t.integer :published_version_id
      t.boolean :is_featured, default: false

      t.timestamps
    end
  end
end
