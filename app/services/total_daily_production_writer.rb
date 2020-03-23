class TotalDailyProductionWriter
  attr_reader :hourly_data

  def initialize(hourly_data)
    @hourly_data = hourly_data
  end

  def perform
    total_daily_production = TotalDailyProduction.find_or_initialize_by(production_day: @hourly_data.first["datetime"].to_date)
    total_daily_production.energy = @hourly_data.map {|row| row["energy"].to_i}.reduce(0, :+)
    total_daily_production.save!
  end
end
