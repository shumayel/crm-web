require_relative 'rolodex.rb'
require_relative 'contact.rb'
require 'sinatra'

get '/' do
@crm_app_name = "My CRM"
@time = Time.new
  erb :index
end

get '/contacts' do

 @contacts = []
  @contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")
  @contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  @contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder")

@contacts_page = "Rolodex"
@new_contact = "Add a New Contact"
    erb :contacts
end