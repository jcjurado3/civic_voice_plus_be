require "csv"

namespace :csv_load do
  task :categories => :environment do
    CSV.foreach("./db/data/categories.csv", headers: true, header_converters: :symbol) do |row|
      Category.create!(row.to_hash)
    end
    puts "Categories imported."
  end

  task :all do
    [:categories].each do |task|
      Rake::Task["csv_load:#{task}".to_sym].invoke
    end
  end

end