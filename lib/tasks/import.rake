require 'csv'

namespace :import do
  desc "Import data from CSV file"
  task :members => :environment do 
    

    CSV.foreach("db/data/legislators-current.csv", headers: true) do |row|
      member = Member.new
      member.first_name = row['first_name']
      member.last_name = row['last_name']
      member.state = row['state']
      member.district = row['district']
      member.party = row['party']
      member.address = row['address']
      member.contact_form = row['contact_form']
      member.save!
    end
  end
end