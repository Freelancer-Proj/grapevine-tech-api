class New < ApplicationRecord
    paginates_per 20
    validates :title, presence: true
    validates :notify_at, presence: true
    validates :content, presence: true
end
