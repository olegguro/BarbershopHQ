#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#подключение к БД
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new
	erb :visit
end

post '/visit' do
	
	@c = Client.new params[:client]
	if @c.save
		erb "<h2>Спасибо, вы записались!</h2>"
	else
		#выводим сообщение об ошибке - в модели "c" есть ствойство errors, у него есть массив
		# в классе массива есть метод first - 1-й элемент массива
		@error = @c.errors.full_messages.first
		erb :visit
	end
end