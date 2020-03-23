class HourlyProductionsController < ApplicationController

  def new
  end

  def bulk_create
    if params[:file].present?
      hourly_data = CsvReader.new(params[:file]).perform
      TotalDailyProductionWriter.new(hourly_data).perform
      HourlyProductionWriter.new(hourly_data).perform
      flash[:alert] = "File succesfully uploaded"
      redirect_to root_path
    else
      flash[:alert] = "You must select a valid CSV file"
      redirect_to new_hourly_production_path
    end

  end

  def index
    @available_days = TotalDailyProduction.all.pluck(:production_day)
    if @selected_day = params[:selected_day]
      @total_daily_production = TotalDailyProduction.find_by(production_day: @selected_day)
      @hourly_productions = @total_daily_production.hourly_productions.includes(:inverter)
    end
  end

  private

  def hourly_productions_params
    params.require(:hourly_production).permit(:file)
  end

end
