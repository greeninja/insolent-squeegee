class Page < ActiveRecord::Base
	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
    
    acts_as_list :scope => :subject
    
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :permalink
    validates_length_of :permalink, :within => 3..255
    # use presence_of with length_of to disallow spaces
    validates_uniqueness_of :permalink
    # for unique values by subject use ":scope => :subject_id"

    scope :visable, lambda { where(:visable => true) }
	scope :invisable, lambda { where(:visable => false) }
	scope :sorted, lambda { order("pages.position ASC") }
	scope :newest_first, lambda { order("pages.created_at DESC") }
	scope :search, lambda {|query|
	  where(["name LIKE ?", "%#{query}%"])
	}
end
