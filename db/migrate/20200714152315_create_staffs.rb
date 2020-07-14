class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :position
      t.string :desc
      t.string :speciality

      t.timestamps
    end
  end
end
