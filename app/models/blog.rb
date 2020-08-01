class Blog < ApplicationRecord
    mount_uploader :images, ImageUploader

    extend FriendlyId
    friendly_id :name, use: :slugged, slug_column: :path

    PASSWORD_FORMAT = /([[:lower:]|[:upper:]]|[0-9]+-?[[:lower:]|[:upper:]])(-[[:lower:]|[:upper:]0-9]+|[[:lower:]|[:upper:]0-9])*/
    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
    validates :path, format: { with: Regexp.new('\A' + PASSWORD_FORMAT.source + '\z'), message: "please enter path in correct format"}
end
