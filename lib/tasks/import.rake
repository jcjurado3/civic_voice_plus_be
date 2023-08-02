require 'csv'

namespace :import do
  desc "Import data from CSV file"
  task :members => :environment do 
    Dir.glob('db/data/state*.csv').each do |file| # Loop over every CSV file in the specified directory that starts with 'state'
      CSV.foreach(file, headers: true) do |row| # Open each file and parse with CSV
        member = Member.new
        member.first_name = row['first_name']
        member.last_name = row['last_name']
        member.full_name = row['name']
        member.email = row['email']
        member.state = row['state']
        member.district = row['current_district']
        member.party = row['party']
        member.party = row['current_party']
        member.address = row['capitol_address']
        member.image_url = row['image']
        member.save!
      end
    end
  end
end