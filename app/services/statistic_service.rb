class StatisticService

  include HTTParty
  base_uri 'https://covid19-brazil-api.now.sh/api/report'

  def initialize
    @options = { }
  end

  def states
    self.class.get("/v1", @options)
  end
end
