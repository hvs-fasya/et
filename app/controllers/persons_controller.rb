class PersonsController < ApplicationController

	before_action :set_person_manager
	before_action :person_params, only: [:create, :destroy, :update]
	before_action :set_person, only: [:show, :edit, :update]

	def index
		@persons = @person_manager.persons
	end

	def new
		@person = Person.new
	end

	def create
		person = @person_factory.build_person
	    if person
			person.fullname = params[:fullname]
			person.email = params[:email]
			person.contacts = params[:contacts]
			@person_manager.add(person)
	      	@person_manager.save_persons
	      	redirect_to action: 'index'
	    else
	      	flash[:danger] = "Smth went wrong (((" 
	      	render 'new'
	    end
	end

	def show
	end

	def edit
	end

	def update
		@person.fullname = params[:fullname]
		@person.email = params[:email]
		@person.contacts = params[:contacts]
		@person_manager.save_persons
		redirect_to action: 'show'
	end

	def destroy
		@person_manager.remove(params[:id].to_i)
		@person_manager.save_persons
		redirect_to action: 'index'
	end

	def clear
		reset_session
		redirect_to action: 'index'
	end

	def seed_faked
		faked_persons = @person_factory.build_fake_person_list 5
		p "faked #{faked_persons}"
		faked_persons.each{|person| @person_manager.add(person)}
		@person_manager.save_persons
		redirect_to action: 'index'
	end

	private

	def set_person_manager
		@person_manager = PersonManager.new(PersonSessionStore.new(session))
		@person_factory = PersonFactory.new(@person_manager.max_id)
	end

	def set_person
		@person = @person_manager.find_by_id(params[:id].to_i)
	end

	def person_params
		params.permit([:id, :fullname, :email, :contacts])
	end
	
end