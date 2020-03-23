class HourlyProduction < ApplicationRecord
  belongs_to :inverter
  belongs_to :total_daily_production
  validates :production_hour, uniqueness: {scope: :inverter}
end
