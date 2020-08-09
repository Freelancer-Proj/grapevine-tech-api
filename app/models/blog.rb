class Blog < ApplicationRecord

    has_many :blogs_staffs, dependent: :destroy
    has_many :staffs, through: :blogs_staffs

    has_many :blog_images, dependent: :destroy


    accepts_nested_attributes_for :blogs_staffs, allow_destroy: true
    accepts_nested_attributes_for :blog_images, allow_destroy: true

    PATH_FORMAT = /([[:lower:]|[:upper:]]|[0-9]+-?[[:lower:]|[:upper:]])(-[[:lower:]|[:upper:]0-9]+|[[:lower:]|[:upper:]0-9])*/
    validates :title, presence: true
    validates :desc, presence: true
    validates :content, presence: true
    validates :path, presence: true, uniqueness: true, format: { with: Regexp.new('\A' + PATH_FORMAT.source + '\z'), message: "Please enter path in correct format"}
end
