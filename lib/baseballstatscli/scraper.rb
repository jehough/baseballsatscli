class Scraper
    def get_game_sites (url)
        site = Nokogiri::HTML(open(url))
        game_sites = site.css('div.game_summaries').css('td.right.gamelink').map do |games|
          url + games.css('a').attribute('href').value
        end
        game_sites
    end
end  