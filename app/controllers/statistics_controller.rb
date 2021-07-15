
class StatisticsController < ApplicationController
  before_action :set_statistic

  # GET /statistics or /statistics.json
  def index
    @statistics_all = Statistic.where('created_at::date = ?', Time.now)
    @total_deaths = @statistics_all.sum(:deaths)
    @total_cases = @statistics_all.sum(:casess)
  end

  def update
    @statistics = @statistic.states
    
    @json = JSON.parse(@statistics.to_s)
    
    @json.each do |key,value|
      value.each do |key2, value2|
        @stati = Statistic.new(
          uf: key2['uf'],
          state: key2['state'],
          casess: key2['cases'],
          deaths: key2['deaths']
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
