class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :path, :tags, :desc, :content, :images
  has_many :staffs
end
