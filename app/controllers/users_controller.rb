require "ostruct"

class UsersController < ApplicationController

	def index
		@users = fake_users
	end

	def new
	  	@user = OpenStruct.new(:fullname => '', :email => '', :contacts => '')
	end

	def create
		@user = make_user
		@users = fake_users
		@users.push(@user)
	    if @user
	      render 'index'
	    else
	      flash[:danger] = "Smth went wrong (((" 
	      render 'new'
	    end
	end

	def show
		@user = make_user
	end

	def edit
		@user = make_user
	end

	def update
		@user = make_user
		if @user
			render 'show'
		end
	end

	def destroy
		@user = make_user
		@users = fake_users
		@users.delete_if{ |i| i.fullname == @user.fullname }
		render 'index'
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

	def make_user
		OpenStruct.new(
			:fullname => params[:fullname],
			:email => params[:email].split(' ').reject{ |e| e.empty? },
			:contacts => params[:contacts])
	end
	
end