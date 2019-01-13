#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#подключение к БД
set :database, "sqlite3:barbershop.db"

class Client < activeRecord::Base
end

get '/' do
	erb "Hello!"			
end