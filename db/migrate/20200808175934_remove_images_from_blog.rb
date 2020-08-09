class RemoveImagesFromBlog < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :images, :string
  end
end
