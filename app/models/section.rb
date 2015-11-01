class Section < ActiveRecord::Base
	belongs_to :page
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	scope :visable, lambda { where(:visable => true) }
	scope :invisable, lambda { where(:visable => false) }
	scope :sorted, lambda { order("sections.position ASC") }
	scope :newest_first, lambda { order("sections.created_at DESC") }
	scope :search, lambda {|query|
	  where(["name LIKE ?", "%#{query}%"])
	}
end
