class Portfolio < ApplicationRecord
    mount_uploader :cover, ImageUploader

    validates :title, presence: true
    validates :type_portfolio, presence: true
end
