class Blog < ApplicationRecord
    mount_uploader :images, ImageUploader

    extend FriendlyId
    friendly_id :path, use: %i(slugged finders)

    def should_generate_new_friendly_id?
      path_changed? || super
    end

    PATH_FORMAT = /([[:lower:]|[:upper:]]|[0-9]+-?[[:lower:]|[:upper:]])(-[[:lower:]|[:upper:]0-9]+|[[:lower:]|[:upper:]0-9])*/
    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
    validates :path, presence: true, uniqueness: true, format: { with: Regexp.new('\A' + PATH_FORMAT.source + '\z'), message: "Please enter path in correct format"}
end
