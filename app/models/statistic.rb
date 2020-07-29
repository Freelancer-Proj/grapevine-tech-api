class Statistic < ApplicationRecord
    validates :number, presence: true
    validates :name, presence: true
end
