namespace :legacy do
  task :load, [:filepath] => :environment do |_t, args|
    legacies = JSON.parse(File.read(args[:filepath]))['features']
    nb_of_legacies = legacies.count.to_f
    legacies.each do |legacy|
      params = legacy.dig('properties').merge(
        geometry_type: legacy.dig('geometry', 'type'),
        longitude: legacy.dig('geometry', 'coordinates', 0),
        latitude: legacy.dig('geometry', 'coordinates', 1)
      )
      if (count = Legacy.count) % 100 == 0
        p "#{(count / nb_of_legacies * 100).round(2)}% - Loaded entries #{count}"
      end
      Legacy.create!(params)
    end
  end

  task :load_tsv, [:filepath] => :environment do |_t, args|
    require 'open-uri'
    @is_header = true
    open(args[:filepath], 'r') do |tsv|
      tsv.each_line do |line|
        raw = line.strip.split("\t")
        if @is_header
          @header = raw
          @is_header = false
        else
          Legacy.create!(Hash[@header.zip(raw)])
        end
      end
    end
  end
end
