require 'rails_helper'
include LogFileHelper

RSpec.describe Galary do
  let(:records) { read_file }

  describe 'galary' do
    context 'return result' do
      subject { described_class.new records }

      it 'form result from log records' do
        expect(subject.build).to eq(result)
      end
    end

    context 'return nil' do
      subject { described_class.new [] }

      it 'form result from log records' do
        expect(subject.build).to eq({})
      end
    end
  end
end
