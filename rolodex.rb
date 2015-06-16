class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1
  end

  # def add_contact(first_name, last_name, email, note)
  #   contact = Contact.new(@@id, first_name, last_name, email, note)
  #   @@id += 1

  #   @contacts << contact
  # end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def delete_contact(id)
    @contacts.delete_if { |name| name == firstnametodelete.id }
  # @contacts.delete(erasecontact) This has to be change dsome how to_i or something.
  end

  def delete_contact(contact_id)
    contact_to_delete = find_contact(contact_id)
    @contacts.delete(contact_to_delete)
  end

  def find_contact(id)
    @contacts.each do |contact|
      if contact.id.to_i == id.to_i
        return contact
      end
    end
      puts "No such contact exists."
  end

  def display_by_attribute(category)
    results = []
    @contacts.each do |contact|
      case category
      when "First Name"
        results << contact.first_name
      when "Last Name"
        results << contact.last_name
      when "E-mail"
        results << contact.email
      when "Notes"
        results << contact.notes
      # else
      #   "Dave, please type the options exactly as shown. Or else you get nothing."
      end

    end

    return results

  end

  def all
    @contacts
  end
end