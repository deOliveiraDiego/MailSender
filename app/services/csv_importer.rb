require "csv"
require "open-uri"

class CsvImporter
  Rails.logger.info "[CSVImporter] Starting Import."
  def self.execute(file_location)
    registers = []
    successful = []
    failed = []
    row_number = 1
    CSV.new(open(file_location), col_sep: ";", :headers => :first_row, encoding: "ISO8859-1").each do |row|
      row = row.entries.map{|field, value| value.try(:strip) }
      register = Hash.new
      register[:voice_actor] = row[0]
      register[:phone] = row[1]
      register[:email] = row[2]
      register[:studio] = row[3]
      register[:time] = row[4]
      register[:date] = row[5]
      register[:formatted_date] = build_date(register[:date]) if register[:date].present?
      unless register.values.uniq.include? nil
        registers << register
      else
        Rails.logger.info "[CSVImporter] Erro ao criar registro: #{register[:voice_actor]}"
      end
    end
    Rails.logger.info "[CSVImporter] Finishing Import."
    registers
  end

  def self.build_date(string)
    arr = string.split("/").map!(&:to_i)
    date = Date.new(Date.today.year, arr[1], arr[0])
  end

end