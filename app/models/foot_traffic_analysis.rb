# FootTrafficAnalysis
class FootTrafficAnalysis
  attr_accessor :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def generate_report
    records = read_log_file
    results = Galary.new(records).build
    format_result(results) # sorting by room index, ascending
  end

  private

  def format_result(results)
    output = []
    results.keys.sort.each do |row| # Sort by room key
      output << results[row]
    end
    output
  end

  # read file
  def read_log_file
    logfile.read
  end
end
