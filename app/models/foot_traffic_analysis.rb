# FootTrafficAnalysis
class FootTrafficAnalysis
  attr_accessor :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  # [\"0 0 I 540\", \"1 0 I 540\", \"0 0 O 560\", \"1 0 O 560\"]
  def print_report
    records = read_log_file
    results = Galary.new(records).build
    display(results) # output
  end

  private

  def display(results)
    output = []
    results.keys.sort.each do |row|
      output << results[row]
    end
    output
  end

  def read_log_file
    logfile.read
  end
end
