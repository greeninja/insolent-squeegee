class Subject < ActiveRecord::Base

    has_many :pages

	scope :visable, lambda { where(:visable => true) }
	scope :invisable, lambda { where(:visable => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }
	scope :search, lambda {|query|
	  where(["name LIKE ?", "%#{query}%"])
	}
end
