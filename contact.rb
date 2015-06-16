class Contact
  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(first_name, last_name, email, notes)
    # @id = id
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end

  def update(attribute, new_value)
    if attribute == "First Name"
      self.first_name = new_value
    elsif attribute == "Last Name"
      self.last_name = new_value
    end
  end

end