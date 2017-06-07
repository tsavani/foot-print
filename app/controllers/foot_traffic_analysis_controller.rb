class FootTrafficAnalysisController < ApplicationController
  def index; end

  def run
    begin
      myfile = params[:file].path if params[:file].present? && params[:file].content_type == 'application/octet-stream'
      if myfile
        traffic_analysis = FootTrafficAnalysis.new(LogFile.new(myfile))
        flash.now[:success] = 'Successfully parsed'
        @output = traffic_analysis.print_report
      else
        redirect_to root_path, flash: { error: 'Something wrong, Please try after sometime or Please upload correct file' }
      end
    rescue StandardError => e
      redirect_to root_path, flash: { error: e.message }
    end
  end
end
