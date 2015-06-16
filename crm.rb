require 'sinatra'

get '/' do
@crm_app_name = "My CRM"
@time = Time.new
  erb :index
end

get '/contacts' do
@contacts_page = "Rolodex"
@new_contact = "Add a New Contact"
    erb :contacts
end