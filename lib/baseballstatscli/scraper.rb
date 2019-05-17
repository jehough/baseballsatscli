class Scraper
    @@site = Nokogiri::HTML(open(https://www.baseball-reference.com/boxes/))
    def get_game_sites (url)
        game_sites = @@site.css('div.game_summaries').css('td.right.gamelink').map do |games|
          url + games.css('a').attribute('href').value
        end
        game_sites
    end
    def get_games
        games = @@site.css('div.game_summaries').css('div.game_summary').map do |game|
        {
          :away_team => game.css('table.teams').css('tr').first.css('td').css('a').text.chomp,
          :away_score =>game.css('table.teams').css('tr').first.css('td.right').first.text,
          :home_team =>game.css('table.teams').css('tr').last.css('td').css('a').text.chomp,
          :home_score =>game.css('table.teams').css('tr').last.css('td.right').first.text
        }
        end
        games
      end
    end
end  