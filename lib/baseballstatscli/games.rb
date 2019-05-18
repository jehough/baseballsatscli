class Baseballstatscli::Games
    attr_accessor :game, :away_team, :home_team, :away_score, :home_score, :winner, :winning_pitcher, :loser, :losing_pitcher
    @@all = []
    def initialize(team1, team2, game)
        @game = "#{team1} vs #{team2}"
        attrs_from_hash(game)
        find_winner
        @@all << self
    end
    def self.create_from_array(games)
        games.each do |game|
        team1 = game[:away_team]
        team2 = game[:home_team]
        Game.new(team1, team2, game)
        end
    end
    def attrs_from_hash(game)
        game.each do |k, v|
        send("#{k}=", v)
        end
    end
    def find_winner
        if self.away_score > self.home_score
        self.winner = self.away_team
        self.loser = self.home_team
        else
        self.winner = self.home_team
        self.loser = self.away_team
        end
    end
    def self.all
        @@all
    end

end