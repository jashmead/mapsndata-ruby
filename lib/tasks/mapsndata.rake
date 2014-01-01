# rakefile for mapsndata

# default didn't get picked up by plain 'rake'
# to run:  rake mapsndata:rake_test
task :default => 'mapsndata:rake_test'

namespace :mapsndata do
  desc "test rakefile for mapsndata"

  task :rake_test do
    puts "Testing mapsndata rakefile"
  end
end

namespace :db do

  desc "Prints the migrated versions"
  task :schema_migrations => :environment do
    puts ActiveRecord::Base.connection.select_values (
      'select version from schema_migrations order by version desc'
    )
  end

  ## the "=> :environment" wraps us in a warm, fuzzy ActiveRecord environment
  ## may need to rebuild the foreign keys here; see how it plays out...
  ## should fix the corresponding sequences as well, is there an ActiveRecord command for this?
  desc "Clear out the tables in development; default reset task is confused by foreign keys"
  task :clear_data => :environment do
    DataSource.delete_all
    Map.delete_all
    User.delete_all
  end

end
