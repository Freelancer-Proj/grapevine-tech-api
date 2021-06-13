class Portfolio < ApplicationRecord
    mount_uploader :cover, ImageUploader
    has_many :portfolio_images, dependent: :destroy

    accepts_nested_attributes_for :portfolio_images, allow_destroy: true

    validates :title, presence: true
    validates :type_portfolio, presence: true
end
