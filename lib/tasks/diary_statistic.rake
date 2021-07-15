namespace :diary_statistic do

    #reke quedispara conta a api e coletao os dados e incero no banco de dados

    task statistic: :environment do
        @statistic = StatisticService.new

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
end