
class StatisticsController < ApplicationController
  before_action :set_statistic

  # GET /statistics or /statistics.json
  def index
    @statistics = @statistic.states
    
    @json = JSON.parse(@statistics.to_s)
    
    @json.each do |key,value|
      value.each do |key2, value2|
        @stati = Statistic.new(
          uf: key2['uf'],
          state: key2['state'],
          casess: key2['cases'],
          deaths: key2['deaths'],
          created_at: key2['datetime']
        ).save
      end

    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = StatisticService.new
    end

    # Only allow a list of trusted parameters through.
    def statistic_params
      params.require(:statistic).permit(:uf, :state, :casess, :deaths, :created_at, :updated_at)
    end
end
