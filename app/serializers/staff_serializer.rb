class StaffSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :desc, :speciality, :avatar
end
