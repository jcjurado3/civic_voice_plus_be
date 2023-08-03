require "csv"

namespace :csv_load do
  task :categories => :environment do
    CSV.foreach("./db/data/categories.csv", headers: true, header_converters: :symbol) do |row|
      Category.create!(row.to_hash)
    end
    puts "Categories imported."
  end

  task :states => :environment do
    CSV.foreach("./db/data/states.csv", headers: true, header_converters: :symbol) do |row|
      State.create!(row.to_hash)
    end
    puts "States imported."
  end

  task :all do
    [:categories, :states].each do |task|
      Rake::Task["csv_load:#{task}".to_sym].invoke
    end
  end

end