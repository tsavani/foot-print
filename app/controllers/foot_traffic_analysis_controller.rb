class FootTrafficAnalysisController < ApplicationController
  def index
    if params[:myfile].present?
      begin
        traffic_analysis = FootTrafficAnalysis.new(LogFile.new(params[:myfile]))
        flash.now[:success] = 'Successfully parsed'
        @output = traffic_analysis.print_report
      rescue StandardError => e
        redirect_to root_path, flash: { error: e.message }
      end
    end
  end

  def run
    if is_file_present? && is_log_file?
      redirect_to root_path(:myfile => params[:file].path)
    else
      redirect_to root_path, flash: { error: 'Something wrong, Please try after sometime or Please upload correct file' }
    end
  end

  private

  def is_file_present?
    params[:file].present?
  end

  def is_log_file?
    params[:file].content_type == 'application/octet-stream'
  end
end
