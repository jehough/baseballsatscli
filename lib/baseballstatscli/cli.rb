class Baseballstatscli::Cli
    def call
        make_games
        while @input != 'exit'
        list_games
        get_user_input
        end
    end
    def list_games
        Baseballstatscli::Game.all.each_with_index do |info, i|
            puts (i +1).to_s + ". #{info.game}"
        end
    end
    def make_games
        games_array = Baseballstatscli::Scraper.get_games
        Baseballstatscli::Game.create_from_array(games_array)
    end
    def get_user_input
        puts "Select a game by number above or for a list of" + " winners".colorize(:red) + " type 'W' or if you would like to be" + " depressed".colorize(:blue) + " and want to see a list of losers, type 'L':"
        @input = gets.chomp
        if @input.upcase == 'W'
            winner_list
        elsif @input.upcase == 'L'
            loser_list
        else
            validate_input
        end
    end
    def winner_list
        win_array = Baseballstatscli::Game.winners
        make_a_list(win_array)
    end
    def loser_list(lose_array)
        lose_array = Baseballstatscli::Game.losers
        make_a_list(lose_array)
    end
    def make_a_list(array)
        array.each_with_index do |team, i|
            puts (i + 1).to_s + ". #{team}"
        end
        last_line
    end
    def validate_input
        if @input.to_i <= Baseballstatscli::Game.all.length
            game = get_game_info
            create_table(game)
        else
            "Sorry, I didn't understand that, try again please:"
            get_user_input
        end
    end
    def get_game_info
        input = @input
        game_obj = Baseballstatscli::Game.find_by_id(input)
    end
    def create_table(game)
        game = get_game_info
      if game.winner == game.home_team
        table = TTY::Table.new ['Team', 'Score', 'Starting Pitcher'], [[game.away_team, game.away_score.to_s, game.losing_pitcher],[game.home_team, game.home_score.to_s, game.winning_pitcher]]
      else
        table = TTY::Table.new ['Team', 'Score', 'pitcher'], [[game.away_team, game.away_score.to_s, game.winning_pitcher],[game.home_team, game.home_score.to_s , game.losing_pitcher]]
      end
      puts table.render(:unicode)
        last_line
    end
    def last_line
        puts "finished? type 'exit' if not, press enter to select another game"
        @input = gets.chomp
    end
end
