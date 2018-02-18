require 'csv'
require 'date'

Condition.destroy_all
Station.destroy_all
Trip.destroy_all

conditions = CSV.open("data/weather.csv", headers: true, header_converters: :symbol)
stations = CSV.open("data/station.csv", headers: true, header_converters: :symbol)
trips = CSV.open("data/trip.csv", headers: true, header_converters: :symbol)


contitions.each do |row|
  Condition.create(id:                    row[:id],
                   date:                  Date.strptime(row[:date], '%m/%d/%Y'),
                   max_temperature:       row[:max_temperature_f],
                   mean_temperature:      row[:mean_temperature_f],
                   min_temperature:       row[:min_temperature_f],
                   mean_humidity:         row[:mean_humidity],
                   mean_visibility:       row[:mean_visibility],
                   mean_wind_speed:       row[:mean_wind_speed],
                   mean_precipitation:    row[:mean_precipitation],
                   zip_code:              row[:zip_code]
                 )
end

stations.each do |row|
  Station.create(id:                      row[:id],
                 name:                    row[:name],
                 latitude:                row[:lat],
                 longitude:               row[:long],
                 dock_count:              row[:dock_count],
                 city:                    row[:city],
                 installation_date:       Date.strptime(row[:installation_date],'%m/%d/%Y')
                )
end

trips.each do |row|
  Trip.create(id:                          row[:id],
              start_date:                  DateTime.strptime(row[:start_date], '%m/%d/%Y %H:%M'),
              start_station_id:            row[:start_station_id],
              end_date:                    row[:end_date],
              end_station_id:              row[:end_station_id],
              bike_id:                     row[:bike_id],
              subscription_type:           row[:subscription_type],
              zip_code:                    row[:zip_code]
            )
end
