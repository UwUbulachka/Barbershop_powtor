#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, "sqlite3:barber.db"

class Client < ActiveRecord::Base # создание сущности

end

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/visit' do
	erb :visit
end

post '/visit' do

	erb "Спасибо вы записались!"
end	