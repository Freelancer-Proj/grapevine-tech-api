class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :path
      t.string :tags
      t.text :desc
      t.text :content
      t.text :images, array: true

      t.timestamps
    end
  end
end
