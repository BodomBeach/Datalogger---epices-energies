class HourlyProductionWriter
  attr_reader :hourly_data

  def initialize(hourly_data)
    @hourly_data = hourly_data
  end

  def perform
    total_daily_production_id = TotalDailyProduction.find_by(production_day: @hourly_data.first["datetime"].to_date).id
    @hourly_data.each do |row|
      if Inverter.exists? id: row["identifier"].to_i
        hourly_production = HourlyProduction.find_or_initialize_by(inverter_id: row["identifier"].to_i, production_hour: row["datetime"].to_datetime, total_daily_production_id: total_daily_production_id)
        hourly_production.energy = row["energy"].to_i
        hourly_production.save!
      end
    end
  end
end
