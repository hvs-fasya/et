class User

	attr_reader :fullname, :email, :contacts

	def initialize(fullname, email, contacts)
		@fullname, @email, @contacts = fullname, email, contacts
	end

end