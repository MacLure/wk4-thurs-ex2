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
  # @title = @contact.first_name + "'s Info"
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
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