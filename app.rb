#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#подключение к БД
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	#вывод списка из БД
	@barbers = Barber.all
end

get '/' do
	erb :index		
end

get '/visit' do
	erb :visit
end

post '/visit' do

		erb "<h2>Спасибо, вы записались!</h2>"
	
end