class Baseballstatscli::Cli
    def call
        
    end
    def list_games

    end
    def make_games
        games_array = Basebasllstatscli::Scraper.get_games
        Game.create_from_array(games_array)
    end
    
end