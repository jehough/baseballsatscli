class Baseballstatscli::Scraper
  @@site = Nokogiri::HTML(open('https://www.baseball-reference.com/boxes/'))

  def self.get_games
    games = []
    @@site.css('div.game_summaries').css('div.game_summary').map do |game|
      hash = {
      :away_team => game.css('table.teams').css('tr').first.css('td').css('a')[0].text.chomp,
      :away_score => game.css('table.teams').css('tr').first.css('td.right').first.text.to_i,
      :home_team => game.css('table.teams').css('tr').last.css('td').css('a').text.chomp,
      :home_score => game.css('table.teams').css('tr').last.css('td.right').first.text.to_i}
      if game.css('table')[1] == nil
        hash[:winning_pitcher] = ''
        hash[:losing_pitcher] = ''
      else
        hash[:winning_pitcher] = game.css('table')[1].css('tr')[0].css('td')[1].text
        hash[:losing_pitcher] = game.css('table')[1].css('tr')[1].css('td')[1].text
      end
      games << hash
    end
    games
  end
end  
