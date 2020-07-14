class CreateContactUs < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_us do |t|
      t.string :inquire_type
      t.string :company_name
      t.string :position
      t.string :name
      t.string :furigana_name
      t.string :email
      t.string :phone
      t.string :content

      t.timestamps
    end
  end
end
