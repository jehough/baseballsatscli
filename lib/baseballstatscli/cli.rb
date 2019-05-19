class Baseballstatscli::Cli
    def call
        make_games
        list_games
        get_user_input
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
        puts "Select a game by number above or for a list of winners type 'W' or if you would like to be depressed and want to see a list of losers, type 'L':"
        @input = gets.chomp
        if input.upcase == 'W'
            winner_list
        elsif input.upcase == 'L'
            loser_list
        else
            validate_input(input)
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
    end
    def validate_input(input)
        if input.to_i > Baseballstatscli::Game.all.length
end