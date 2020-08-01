class Blog < ApplicationRecord
    mount_uploader :images, ImageUploader

    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
    validates :path, presence: true, uniqueness: true

  def to_param
      path
  end
end
