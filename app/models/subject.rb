class Subject < ActiveRecord::Base

    has_many :pages
    acts_as_list
    # Don't need to validate (in most cases!):
    # ids, foreign keys, timestamps, booleans, counters
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    # validates_presence_of vs. validates_length_of :minumum => 1
    # different error messages: "Cant be blank" or "is too short"
    # validates_length_of allows strings with only spaces!

	scope :visable, lambda { where(:visable => true) }
	scope :invisable, lambda { where(:visable => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }
	scope :search, lambda {|query|
	  where(["name LIKE ?", "%#{query}%"])
	}
end
