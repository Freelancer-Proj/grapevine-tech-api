class Staff < ApplicationRecord
    validates :name, presence: true
    validates :position, presence: true
    validates :speciality, presence: true
end
