class ApiMember
  attr_reader :first_name,
              :last_name,
              :full_name, 
              :id,
              :email,
              :party,
              :image_url

  def initialize(data)
    @id = data[:id]
    @email = data[:email]
    @party = data[:party]
    @image_url = data[:image_url]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @full_name = data[:full_name]
  end
end
