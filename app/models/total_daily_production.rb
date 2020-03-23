class TotalDailyProduction < ApplicationRecord
  has_many :hourly_productions
  has_many :inverters, through: :total_daily_productions_inverters, inverse_of: :total_daily_productions

  validates :production_day, presence: true
  validates :production_day, uniqueness: true
end
