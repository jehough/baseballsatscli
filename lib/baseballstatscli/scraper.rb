class Scraper
  @@site = Nokogiri::HTML(open(https://www.baseball-reference.com/boxes/))

  def get_games
      games = @@site.css('div.game_summaries').css('div.game_summary').map do |game|
      {
        :away_team => game.css('table.teams').css('tr').first.css('td').css('a').text.chomp,
        :away_score =>game.css('table.teams').css('tr').first.css('td.right').first.text.to_i,
        :home_team =>game.css('table.teams').css('tr').last.css('td').css('a').text.chomp,
        :home_score =>game.css('table.teams').css('tr').last.css('td.right').first.text.to_i,
        :winning_pitcher => game.css('table')[1].css('tr')[0].css('td')[1].text,
        :losing_pitcher => game.css('table')[1].css('tr')[1].css('td')[1].text
      }
      end
      games
    end
  end
end  