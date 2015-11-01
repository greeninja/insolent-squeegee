class Page < ActiveRecord::Base
	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

    scope :visable, lambda { where(:visable => true) }
	scope :invisable, lambda { where(:visable => false) }
	scope :sorted, lambda { order("pages.position ASC") }
	scope :newest_first, lambda { order("pages.created_at DESC") }
	scope :search, lambda {|query|
	  where(["name LIKE ?", "%#{query}%"])
	}
end
