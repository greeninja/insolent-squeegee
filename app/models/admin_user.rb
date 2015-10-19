class AdminUser < ActiveRecord::Base
	# To configure a different table:
	# self.table_name = "admin_users"
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
end
