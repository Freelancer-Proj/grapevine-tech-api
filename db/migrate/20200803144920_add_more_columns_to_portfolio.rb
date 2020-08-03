class AddMoreColumnsToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :period, :string
    add_column :portfolios, :media, :string
    add_column :portfolios, :main_tech, :string
  end
end
