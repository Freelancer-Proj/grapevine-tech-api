class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :path, :tags, :desc, :content, :images, :created_at, :updated_at
  has_many :staffs
end
