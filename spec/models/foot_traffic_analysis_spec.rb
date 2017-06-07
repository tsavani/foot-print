require 'rails_helper'
include LogFileHelper

RSpec.describe FootTrafficAnalysis do
  let(:file) { 'file.log' }
  let(:records) { read_file }

  describe 'foot traffic analysis' do
    subject { described_class.new file }

    before do
      allow(subject).to receive(:read_log_file).and_return(read_file)
      allow(Galary.new(records)).to receive(:build).and_return(result)
    end

    it 'print report correct report' do
      expect(subject.print_report).to eq(result_sorted)
    end
  end
end
