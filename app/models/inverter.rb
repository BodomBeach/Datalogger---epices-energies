class Inverter < ApplicationRecord
  has_many :hourly_productions
  has_many :total_daily_productions, through: :total_daily_productions_inverters, inverse_of: :inverters
end
