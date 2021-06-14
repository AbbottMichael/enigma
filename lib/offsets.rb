require 'strscan'
require 'time'

class Offsets
  attr_reader :offsets_hash,
              :verified_date

  def initialize(date)
    @date          = date
    @verified_date = verify_date
    @offsets_hash  = offsets_hash_builder
  end

  def verify_date
    return date_today if @date == 'date today'
    invalid_1 = 'INVALID DATE! (must have 6 digits: DDMMYY)'
    return invalid_1 if @date.length != 6
    date_scan = StringScanner.new(@date)
    invalid_2 = 'INVALID DATE! (only integer values are acceptable)'
    return invalid_2 if date_scan.skip(/\d+/) != 6
    @date
  end

  def date_today
    today_time = Time.new
    today_time.strftime("%d%m%y")
  end

  def processed_date
    date_squared = (@verified_date.to_i) ** 2
    return '0000' if date_squared == 0
    date_squared.to_s[-4..-1]
  end

  def offsets_hash_builder
    @offsets_hash = {
      A: processed_date[0].to_i,
      B: processed_date[1].to_i,
      C: processed_date[2].to_i,
      D: processed_date[3].to_i
    }
  end
end
