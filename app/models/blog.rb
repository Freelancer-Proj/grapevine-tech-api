class Blog < ApplicationRecord
    mount_uploader :images, ImageUploader

    PATH_FORMAT = /([[:lower:]|[:upper:]]|[0-9]+-?[[:lower:]|[:upper:]])(-[[:lower:]|[:upper:]0-9]+|[[:lower:]|[:upper:]0-9])*/
    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
    validates :path, presence: true, uniqueness: true, format: { with: Regexp.new('\A' + PATH_FORMAT.source + '\z'), message: "Please enter path in correct format"}
end
