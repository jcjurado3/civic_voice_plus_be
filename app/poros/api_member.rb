class ApiMember
  attr_reader :first_name,
              :last_name, 
              :full_name

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @full_name = data[:full_name]
  end
end