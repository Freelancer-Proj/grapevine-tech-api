class Review < ApplicationRecord
    # mount_uploader :avatar, AvatarUploader
    
    validates :content, presence: true
    validates :reviewer, presence: true
end
