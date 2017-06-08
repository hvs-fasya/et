require "ostruct"

class UsersController < ApplicationController

	def index
		@users = fake_users
	end

	def new
	  	@user = OpenStruct.new(:fullname => '', :email => '', :contacts => '')
	end

	def create
		@user = OpenStruct.new(params[:user])
	    if !@user
	      redirect_to user_path(@user)
	    else
	      flash[:danger] = "Smth went wrong (((" 
	      redirect_to edit_user_path(@user)
	    end
	end

	def show
	end

	def edit
		
	end

	def update
		
	end

	private

	def fake_users
		users = Array.new()
		users.push(OpenStruct.new(
			:fullname => 'Иванов Иван Иванович',
			:email => Array.new() << 'ivanov@example.com' << 'ivanov@ivanov.com',
			:contacts => 'contacts1'))
		users.push(OpenStruct.new(
			:fullname => 'Сидоров Сидор Сидорович',
			:email => Array.new() << 'sidorov@example.com',
			:contacts => 'contacts2'))
		users.push(OpenStruct.new(
			:fullname => 'Эйабдурахман-оглы Теймураз Хафиздурмухаммедович',
			:email => Array.new() << 'ogly@example.com',
			:contacts => 'contacts3'))
		users
	end
	
end