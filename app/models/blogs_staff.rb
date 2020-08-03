class BlogsStaff < ApplicationRecord
    belongs_to :blog
    belongs_to :staff
    validates_uniqueness_of :staff_id, :scope => [:blog_id]
end
