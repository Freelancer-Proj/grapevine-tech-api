class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :path
      t.string :tags
      t.string :desc
      t.string :content
      t.string :images

      t.timestamps
    end
  end
end
