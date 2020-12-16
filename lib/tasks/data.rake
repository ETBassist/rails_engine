require 'csv'

namespace :data do
  desc "Create db, load schema, and seed"
  task :import do
    puts 'WARNING: This will destroy any data currently in the database when run.'
    print 'Are you sure you want to continue? [Y/N]: '
    input = STDIN.gets.chomp
    if input.upcase == 'Y'
      puts 'Importing data'
    else
      puts 'Import canceled'
      abort
    end

    Rake::Task['db:create'].invoke
    Rake::Task['db:schema:load'].invoke

    cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails_engine_development db/data/rails-engine-development.pgdump"
    puts "Loading PostgreSQL Data dump into local database with command:"
    puts cmd
    system(cmd)

    CSV.foreach("#{Rails.root}/db/data/items.csv", headers: true) do |row|
      Item.create!(
        id: row["id"].to_i,
        unit_price: (row["unit_price"].to_i * 0.01).round(2),
        merchant_id: row["merchant_id"].to_i,
        description: row["description"],
        name: row["name"],
        created_at: row["created_at"],
        updated_at: row["updated_at"]
      )
    end

    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.reset_pk_sequence!(table)
    end
    puts 'Database created and seeded'
  end

end
