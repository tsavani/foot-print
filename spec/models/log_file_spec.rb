require 'rails_helper'
include LogFileHelper

RSpec.describe LogFile do
  let (:file) { 'file.log' }

  describe 'read log file' do
    subject { described_class.new file }

    before do
      allow(subject).to receive(:read_file).and_return(file_data)
    end

    it 'returns array of all records' do
      expect(subject.read).to eq(read_file)
    end
  end
end
