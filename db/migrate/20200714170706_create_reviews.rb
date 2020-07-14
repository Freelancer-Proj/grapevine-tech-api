class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :reviewer
      t.string :position
      t.string :avatar

      t.timestamps
    end
  end
end
