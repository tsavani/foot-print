require 'rails_helper'
include LogFileHelper

RSpec.describe FootTrafficAnalysisController, type: :controller do
  describe 'GET "index"' do
    let(:file) { 'file.log' }

    before do
      allow(FootTrafficAnalysis.new(LogFile.new(file))).to receive(:generate_report).and_return(result_sorted)
    end

    it 'returns a success' do
      get :index
      expect(response).to be_success
    end

    it 'returns result' do
      get :index, params: { myfile: 'myfile.log' }
      expect(response).to be_success
    end
  end

  describe 'POST "run"' do
    before do
      allow(controller).to receive(:file_present?).and_return(true)
      allow(controller).to receive(:log_file?).and_return(true)
    end

    it 'returns a success' do
      post :run, params: { file: Rack::Test::UploadedFile.new(Rails.root + 'spec/support/file.log') }
      expect(response).to have_http_status(:found)
    end
  end
end
