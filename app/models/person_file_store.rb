class PersonFileStore
	
	PERSONS_FILE_PATH = "#{Rails.root.to_s}/tmp/persons.json"

	def initialize
		unless File.file?(PERSONS_FILE_PATH) 
			File.open(PERSONS_FILE_PATH, "w") {|f| f << {}.to_json}
		end
	end

#{1: {id: 1, name: 'Anton'}, 2: {id: 2, name: 'Lena'}, 3: {id: 3, name: 'Vasya'}}

	def read
		result = {}
		persons_json = File.read(PERSONS_FILE_PATH)
		persons = JSON.parse(persons_json)
		persons.each_key do |id|
			person = persons[id]
			person = person.with_indifferent_access
			result[person[:id]] = Person.new(person[:id], person[:fullname], person[:email], person[:contacts])
		end
		result
	end

	#{1: Person(id: 1, name: 'Anton'), 2: Person(id: 2, name: 'Lena'), 3: Person(id: 3, name: 'Vasya')}
	
	def write(persons)
		result = {}
		persons.each_key do |id|
			result[id] = persons[id].to_h
		end
		File.open(PERSONS_FILE_PATH, "w") do |f|
			f << result.to_json
		end
	end

end