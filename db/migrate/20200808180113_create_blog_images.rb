class CreateBlogImages < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_images do |t|
      t.integer :blog_id
      t.string :image

      t.timestamps
    end
  end
end
