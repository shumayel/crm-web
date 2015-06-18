require_relative 'rolodex.rb'
require_relative 'contact.rb'
require 'sinatra'

$rolodex = Rolodex.new
@@rolodex = Rolodex.new

@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar Programmer"))

get '/' do
@crm_app_name = "The Boutique Rolodex."
@boutique = "The boutique rolodex."
@time = Time.new
  erb :index
end

get '/contacts' do

 @contacts = []
  # @contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")
  # @contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  # @contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder")

@contacts_page = "Rolodex"
@new_contact = "Add a New Contact"
    erb :contacts
end

get "/contacts/new" do
erb :new_contacts
end

post '/contacts' do
    puts params
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get "/contacts/1" do
@contact = @@rolodex.find_contact(1)
erb :show_contact
end