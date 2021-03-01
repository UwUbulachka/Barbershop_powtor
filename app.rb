#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, "sqlite3:barber.db"

class Client < ActiveRecord::Base # создание сущности
	validates :name, presence: true  
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base

end	

before do
	@barbers = Barber.all
end

get '/' do
  erb :index
end

get '/visit' do
	@c = Client.new params
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client]
	if @c.save
		erb "Спасибо вы записались!"
	else 
		@error = @c.errors.full_messages.first
		erb :visit
	end	
end	

get '/barber/:id' do

	@barber = Barber.find(params[:id])
	erb :barber

end	

get '/bookings' do
	@clients = Client.order('created_at DESC')
 	
 	erb :bookings
end	

get '/client/:id' do
  @client = Client.find(params[:id])
  erb :client 
end