require 'rails_helper'

RSpec.describe Visitor do
  context 'Creating' do
    context "when a visitor is specified" do
      it "uses that visitor data" do
        visitor = '0'
        room = '11'
        status = 'I'
        time = '347'

        visitor_record = Visitor.new(visitor,room, status, time)

        expect(visitor_record.room).to be == '11'
        expect(visitor_record.status).to be == 'I'
        expect(visitor_record.time).to be == 347
      end
    end
  end
end
