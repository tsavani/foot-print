class LogFile
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  # @return
  # [\"0 0 I 540\", \"1 0 I 540\", \"0 0 O 560\", \"1 0 O 560\"]
  def read
    lines = read_file # Get the number of lines to read
    lines.shift # remove first element
    lines
  end

  private

  def read_file
    @_read_file ||= File.open(file).collect(&:chomp)
  end
end
