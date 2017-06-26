class PersonManager

	def initialize store
		@store = store
		@persons = store.read
	end

	def save_persons
		@store.write(@persons)
	end

	def add(person)
		@persons[person.id] = person
	end

	def remove(id)
		@persons.delete(id)
	end

	def persons
		@persons.dup
	end

	def find_by_id(id)
		@persons[id]
	end

	def max_id
		@persons.keys.max || 0
	end
end