class FootTrafficAnalysisController < ApplicationController
  def index
    @output = process_file if file_params[:file].present?
  end

  def run
    if file_present? && log_file?
      redirect_to root_path(file: file_params[:file].path)
    else
      redirect_to root_path, flash: { error: 'Something wrong, Please try after sometime or Please upload correct file' }
    end
  end

  private

  def process_file
    begin
      traffic_analysis = FootTrafficAnalysis.new(LogFile.new(file_params[:file]))
      flash.now[:success] = 'Successfully parsed'
      traffic_analysis.generate_report
    rescue StandardError => e
      redirect_to root_path, flash: { error: e.message }
    end
  end

  # check if file is present or not?
  def file_present?
    file_params[:file].present?
  end

  # allow only '.log' file,
  # In order to support CSV file: add Content-Type: text/csv
  def log_file?
    file_params[:file].content_type == 'application/octet-stream'
  end

  def file_params
    params.permit(:file)
  end
end
