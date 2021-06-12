class CreatePortfolioImages < ActiveRecord::Migration[6.0]
    def change
      create_table :portfolio_images do |t|
        t.integer :portfolio_id
        t.string :image
  
        t.timestamps
      end
    end
  end
  