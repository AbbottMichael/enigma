require 'time'

class Offsets
  attr_reader :date, :offsets_hash

  def initialize(date)
    @date = date
    @offsets_hash = {}
  end

  def verify_date(date)
    return date if date == 'todays date'
    invalid_1 = 'invalid date: must have 6 digits'
    return invalid_1 if date.length != 6
    date_scan = StringScanner.new(date)
    invalid_2 = 'invalid date: only integer values are acceptable'
    return invalid_2 if date_scan.skip(/\d+/) != 6
    date
  end

  def todays_date
    today_time = Time.new
    today_time.strftime("%d%m%y")
  end

  def process_date
    date_squared = (@date.to_i) ** 2
    date_squared.to_s[-4..-1]
  end
end
