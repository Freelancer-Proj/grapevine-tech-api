class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :path, :tags, :desc, :content, :created_at, :updated_at
  has_many :staffs
  has_many :blog_images
end
