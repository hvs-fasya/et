require "ostruct"

class UsersController < ApplicationController

	def index
		@users = fake_users
	end

	private

	def fake_users
		users = Array.new()
		users.push(OpenStruct.new(:fullname => 'fullname1', :email => 'email1', :contacts => 'contacts1'))
		users.push(OpenStruct.new(:fullname => 'fullname2', :email => 'email2', :contacts => 'contacts2'))
		users.push(OpenStruct.new(:fullname => 'fullname3', :email => 'email3', :contacts => 'contacts3'))
		users
	end
	
end