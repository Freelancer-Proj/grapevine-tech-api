class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :position
      t.text :desc
      t.string :speciality
      t.string :avatar

      t.timestamps
    end
  end
end
