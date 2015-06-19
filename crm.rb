require_relative 'rolodex.rb'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
    include DataMapper::Resource

      property :id, Serial
      property :first_name, String
      property :last_name, String
      property :email, String
      property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

$rolodex = Rolodex.new
$rolodex = Rolodex.new
# $rolodex.add_contact(Contact.new(1, "Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")

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
        @contact.first_name = params[:first_name]
        @contact.last_name = params[:last_name]
        @contact.email = params[:email]
        @contact.notes = params[:note]
        redirect to("/contacts")
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

delete "/contacts/:id" do
  @contact = $rolodex.find_contact(params[:id].to_i)
    if @contact
    $rolodex.delete_contact(@contact)
    redirect to("/contacts")
    else
        raise Sinatra::NotFound
    end
end

# get "/contacts/1" do
#   @contact = $rolodex.find_contact(1)
#   erb :show_contact
# end