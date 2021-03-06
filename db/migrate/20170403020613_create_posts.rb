class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
