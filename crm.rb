require_relative 'contact'
require 'sinatra'

after do
  ActiveRecord::Base.connection.close
end

get '/index' do
  @title = "Index"
  erb :index
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  @title = @contact.first_name + "'s Info"

  erb :show_contact
end

get '/contacts' do
  @title = "Bitmaker CRM"
  @contacts = Contact.all
  erb :contacts
end

get '/' do
  redirect to('/index')
end

get '/about' do
  @title = "About Us"
  erb :about
end