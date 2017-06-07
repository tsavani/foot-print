require 'rails_helper'
include LogFileHelper

RSpec.describe Room do
  describe 'create room record' do
    subject { described_class.new visits }

    it 'returns room' do
      expect(subject.build).to eq('Room 11, 29 minute average visit, 1 visitor(s) total')
    end
  end
end
