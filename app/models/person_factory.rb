class PersonFactory

	def initialize max_id
		@max_id = max_id
	end

	def build_person
		new_person = Person.new(next_id)
	end

	def build_fake_person_list qty
		persons = Array.new
		qty.times do |i|
			fake_person_id = next_id + i
			persons << Person.new(
				fake_person_id, 
				"fullname#{fake_person_id}",
				"email#{fake_person_id}",
				"contacts#{fake_person_id}"
				)
		end
		persons
	end

	private

	def next_id
		@max_id + 1
	end

end