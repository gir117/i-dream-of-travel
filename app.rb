require 'bundler'
Bundler.require()

#=====================================CONNECT TO DATABASE
ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  database: :travel
)

#=====================================MODELS

require './models/location.rb'
require './models/user.rb'
require './models/visit.rb'

#=====================================ROUTES

get '/' do
  'what up dude?'
end

#=====================================API ROUTES

#=====================================show all of the users
get '/api/users' do
  content_type :json
  users = User.all
  users.to_json
end

#=====================================return a specific user
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

#=====================================create a new user
post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end

#=====================================Update an existing user
patch '/api/users/:id' do
  content_type :json
  id = params[:id].to_i
  data = params[:user]
  user = User.find(id)
  user.update(data)
  user.to_json
end

patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

#=====================================Delete an existing user

delete '/api/users/:id' do
  content_type :json
  user = User.delete(params[:id].to_i)
end

#=====================================get all locations
get '/api/locations' do
  content_type :json
  locations = Location.all
  locations.to_json
end

#=====================================get a specific location
get '/api/locations/:id' do
  content_type :json
  location = Location.find(params[:id].to_i)
  location.to_json
end

#=====================================create a new location
post '/api/locations' do
  content_type :json
  location = Location.create(params[:location])
  location.to_json
end

#=====================================update an existing location
put '/api/locations/:id' do
  content_type :json
  location = Location.find(params[:id].to_i)
  location.update(params[:location])
  location.to_json
end

patch '/api/locations/:id' do
  content_type :json
  location = Location.find(params[:id].to_i)
  location.update(params[:location])
  location.to_json
end

#=====================================delete a specific location
delete '/api/locations/:id' do
  content_type :json
  location = Location.delete(params[:id].to_i)
end

#=====================================get all the visits
get '/api/visits' do
  content_type :json
  visits = Visit.all
  visits.to_json(:include => [:user, :location])
end

#=====================================get a specific visit
get '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.to_json(:include => [:user, :location])
end

#=====================================create a new visit
post '/api/visits' do
  content_type :json
  visit = Visit.create(params[:visit])
  visit.to_json
end

#=====================================update a specific visit
put '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.update(params[:visit])
  visit.to_json
end

patch '/api/visits/:id' do
  content_type :json
  visit = Visit.find(params[:id].to_i)
  visit.update(params[:visit])
  visit.to_json
end

#=====================================delete a specific visit
delete '/api/visits/:id' do
  content_type :json
  visit = Visit.delete(params[:id].to_i)
end
