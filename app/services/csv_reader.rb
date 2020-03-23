require 'csv'

class CsvReader
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def perform
    CSV.read(@file, headers: true)
  end

end
