class CreateBlogsStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs_staffs do |t|
      t.integer :blog_id
      t.integer :staff_id

      t.timestamps
    end
  end
end
