require_relative 'rolodex.rb'
require_relative 'contact.rb'
require 'sinatra'

$rolodex = Rolodex.new
$rolodex = Rolodex.new
$rolodex.add_contact(Contact.new(1, "Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar Programmer"))
$rolodex.add_contact(Contact.new(2, "Powerpuff", "Girl", "powerpuff@bitmakerlabs.com", "Powerpuff Girls"))
$rolodex.add_contact(Contact.new(3, "Dexters", "Lab", "dexter@bitmakerlabs.com", "Dexter Labs"))
$rolodex.add_contact(Contact.new(4, "Meemee", "Dexter", "meemee@bitmakerlabs.com", "Dexters Sister"))

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
  new_contact = Contact.new(param [:id], params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get "/contacts/:id" do
    @contact = $rolodex.find_contact(params[:id].to_i)
    if @contact
        erb :show_contact
else
    raise Sinatra::NotFound
    end
end

get "/contacts/:id/edit" do
     @contact = $rolodex.find_contact(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end