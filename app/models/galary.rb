# Now that we have all the recorded,
# create visitor record and group them by room

class Galary
  attr_accessor :records

  def initialize(records)
    @records = records
  end

  def build
    results = {}
    room_wise_visitors_group.each do |room, visit|
      results[room.to_i] = Room.new(visit).build
    end
    results
  end

  private

  def room_wise_visitors_group
    visitors_log.group_by(&:room)
  end

  # @return
  # [<Visitor:0x007fccc2abe488 @visitor=\"0\", @room=\"0\", @status=\"I\", @time=540>,
  #  <Visitor:0x007fccc2abe398 @visitor=\"1\", @room=\"0\", @status=\"I\", @time=540>,
  #  <Visitor:0x007fccc2abe2a8 @visitor=\"0\", @room=\"0\", @status=\"O\", @time=560>,
  #  <Visitor:0x007fccc2abe1b8 @visitor=\"1\", @room=\"0\", @status=\"O\", @time=560>]"
  def visitors_log
    visitors = records.collect do |line|
      visitor_id, room_index, visitor_activity, timestemp = line.split
      Visitor.new(visitor_id, room_index, visitor_activity, timestemp)
    end
    visitors
  end
end
