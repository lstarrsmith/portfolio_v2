class Admin < ActiveRecord::Base
	self.has_secure_password
end
