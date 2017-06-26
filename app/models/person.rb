class Person

	attr_reader :id
	attr_accessor :fullname, :email, :contacts

	def initialize(id = nil, fullname = '', email = '', contacts = '')
		@id, @fullname, @email, @contacts = id, fullname, email, contacts
	end

	def to_h
		{id: @id, fullname: @fullname, email: @email, contacts: @contacts}
	end

end