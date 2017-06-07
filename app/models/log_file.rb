class LogFile
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def read
    lines = read_file
    lines.shift # remove first element
    lines
  end

  private

  def read_file
    @_read_file ||= File.open(file).collect(&:chomp)
  end
end
