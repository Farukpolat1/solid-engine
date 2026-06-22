require 'sinatra'
require 'sinatra/reloader'
require_relative 'database'

set :views, File.dirname(__FILE__) + '/views'

get '/' do
  @todos = DB[:todos].all
  erb :index
end

post '/add' do
  DB[:todos].insert(title: params[:title], completed: false)
  redirect '/'
end

post '/delete/:id' do
  DB[:todos].where(id: params[:id]).delete
  redirect '/'
end

post '/toggle/:id' do
  todo = DB[:todos].where(id: params[:id]).first
  DB[:todos].where(id: params[:id]).update(completed: !todo[:completed])
  redirect '/'
end