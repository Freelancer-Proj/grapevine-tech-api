class ContactUs < ApplicationRecord
    validates :name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :inquire_type, presence: true
end
