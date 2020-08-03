class Staff < ApplicationRecord

    has_many :blogs_staffs
    has_many :blogs, through: :blogs_staffs

    validates :name, presence: true
    validates :position, presence: true
    validates :speciality, presence: true
end
