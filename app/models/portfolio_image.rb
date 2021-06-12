class PortfolioImage < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :portfolio
end
