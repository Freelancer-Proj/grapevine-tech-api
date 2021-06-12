class Portfolio < ApplicationRecord
    has_many :portfolio_images, dependent: :destroy

    accepts_nested_attributes_for :portfolio_images, allow_destroy: true

    validates :title, presence: true
    validates :type_portfolio, presence: true
end
