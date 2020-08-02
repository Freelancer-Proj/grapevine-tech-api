class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :type_portfolio
      t.text :desc
      t.string :cover
      t.text :content

      t.timestamps
    end
  end
end
