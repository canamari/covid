
class StatisticsController < ApplicationController

  # GET /statistics or /statistics.json
  def index
    @statistics_all = Statistic.where('created_at::date = ?', Time.now)
    @total_deaths = @statistics_all.sum(:deaths)
    @total_cases = @statistics_all.sum(:casess)

    @statistic_diari = Statistic.where('created_at::date = ?', 1.day.ago)
    @total_cases_diary = @statistic_diari.sum(:casess) - @total_cases
    @total_deaths_diary = @statistic_diari.sum(:deaths) - @total_deaths
  end

  private
    def statistic_params
      params.require(:statistic).permit(:uf, :state, :casess, :deaths, :created_at, :updated_at)
    end
end
