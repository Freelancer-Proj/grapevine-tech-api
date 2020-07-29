class Blog < ApplicationRecord
    mount_uploader :images, ImageUploader

    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
end
