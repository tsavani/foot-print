module LogFileHelper

  def file_data
    ["8","0 11 I 347", "1 13 I 307", "2 15 I 334", "3 6 I 334", "0 11 O 376", "1 13 O 321", "2 15 O 389", "3 6 O 412"]
  end

  def read_file
    ["0 11 I 347", "1 13 I 307", "2 15 I 334", "3 6 I 334", "0 11 O 376", "1 13 O 321", "2 15 O 389", "3 6 O 412"]
  end

  def visits
    [ Visitor.new("0", "11", "I","347"), Visitor.new("0", "11", "O", "376") ]
  end

  def result
    {
      11 => "Room 11, 29 minute average visit, 1 visitor(s) total",
      13 => "Room 13, 14 minute average visit, 1 visitor(s) total",
      15 => "Room 15, 55 minute average visit, 1 visitor(s) total",
      6 => "Room 6, 78 minute average visit, 1 visitor(s) total"
    }
  end

  def result_sorted
    [
      "Room 6, 78 minute average visit, 1 visitor(s) total",
      "Room 11, 29 minute average visit, 1 visitor(s) total",
      "Room 13, 14 minute average visit, 1 visitor(s) total",
      "Room 15, 55 minute average visit, 1 visitor(s) total"
    ]
  end
end
