# Write your code here!

# rspec spec/hashketball_spec.rb -e game_hash


require 'pry'
def game_hash
  
  sports_data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
        ]
    }
  }
  
  sports_data
end

# game_hash


# p game_hash[:away][:players][3][:rebounds]
# game_hash[home/away-2keys][3keys][i][9keys]


 # select (Enumerable Family Tree)

def raw_players_and_stats(data)
    # Need to put team_players_members inside an array to group the 2 team arrays together
    all_players_stats = []
    
    data.each_pair do |team, team_stats|
      team_stats.each_pair do |team_players, team_players_members|
        
         if team_players == :players          
         	all_players_stats << team_players_members           
         end
                     
      end
    end
  all_players_stats
end

# p raw_players_and_stats(game_hash)




def players_stats(data)
  stats = {}
  sub_data = raw_players_and_stats(data)
  
  sub_data.map do |team|
    team.map do |player|
      player.each_pair do |player_keys, player_values|
      
        if player_keys == :player_name
          stats[player_values] = player
        end
        
      end
    end
  end
  stats
end

# p players_stats(game_hash)






# num_points_scored  takes an argument of a player's name and returns the number of points scored for that player
# rspec spec/hashketball_spec.rb -e num_points_scored

def num_points_scored(player)
  
  data = game_hash
  player_hash = players_stats(data)
  
  player_hash.each_pair do |name, player_stat|
    
    if name == player
        player_stat.each_pair do |player_key, player_value|
             if player_key == :points
               return player_value
             end
        end
    end
    
  end
  
  nil
end

# p num_points_scored("Jason Terry")



def shoe_size(player)
  
  data = game_hash
  player_hash = players_stats(data)
  
  player_hash.each_pair do |name, player_stat|
    
    if name == player
        player_stat.each_pair do |player_key, player_value|
             if player_key == :shoe
               return player_value
             end
        end
    end
    
  end
  
  nil
end

# p shoe_size("Jeff Adrien")



def team_name_stats(data)
  team_stats = {}
  
  data.each_pair do |home_away, home_away_hash|
    home_away_hash.each_pair do |team_key, team_value|
      
      if team_key == :team_name
        team_stats[team_value] = home_away_hash
      end
      
    end
  end
  
  team_stats
end

# p team_name_stats(game_hash)


# Build a method, team_colors, that takes in an argument of the team name and returns an Array of that team's colors

def team_colors(team)
  
  data = game_hash
  teams = team_name_stats(data)
  
  teams.each_pair do |team_name, team_hash|
    if team_name == team
      team_hash.each_pair do |team_key, team_value|
        if team_key == :colors
          return team_value
        end
      end
    end
  end
  
  nil  
end

# p team_colors("Charlotte Hornets")



# Build a method, team_names, that operates on the game Hash to return an Array of the team names.

def team_names
  data = game_hash
  all_teams = []
  
  data.each_pair do |home_away, home_away_hash|
    home_away_hash.each_pair do |team_key, team_value|
      
      if team_key == :team_name
        all_teams << team_value
      end
    
    end
  end
  all_teams
end

# p team_names



# Build a method, player_numbers, that takes in an argument of a team name and returns an Array of the jersey numbers for that team.

def player_numbers(team)
  # data = game_hash
  jersey_data = team_name_stats(game_hash)
  jersey_nums = []
  
  jersey_data.each_pair do |team_name, team_hash|
    if team_name == team
      team_hash.each_pair do |team_key, team_value|
        if team_key == :players
          team_value.map do |player|
            player.each_pair do |player_key, player_value|
              
              if player_key == :number
                jersey_nums << player_value
              end
              
            end
          end
        end
      end
    end
  end
  
  jersey_nums
end
  
# p player_numbers("Charlotte Hornets") 
  
  
  
# Build method, player_stats, takes in argument of a player's name and returns a hash of that player's stats

def player_stats(name)
  players = players_stats(game_hash)
  
  players.each_pair do |player, stats|
    if player == name
      
      # Fix code to pass the LEARN test
      stats.delete(:player_name)
      
      return stats
    end
  end
  nil
end
  
# p  player_stats("Jeff Adrien") 
  



# method, big_shoe_rebounds, returns the number of rebounds associated with the player that has the largest shoe size
# First, find the player with the largest shoe size
# Then, return that player's number of rebounds [Remember to think about return values here.]

require 'pry'
def big_shoe_rebounds
  all_players = players_stats(game_hash)
  shoe_size = 0
  
  all_players.each_pair do |name, stats|
    stats.each_pair do |player_key, player_value|
      
      if player_key == :shoe
        if player_value > shoe_size
          shoe_size = player_value
        end
      end
      
    end
  end
  
  shoe_size
  bucket = []
  
  all_players.each_pair do |name, stats|
        stats.each_pair do |player_key, player_value|
          
          if player_key == :shoe && player_value == shoe_size
            
            bucket << stats
            
            bucket.map do |index|
              index.each_pair do |p_key, p_value|
                
                if p_key == :rebounds
                  return p_value
                end
                
              end
            end
            
          end
          
        end
  end
  
  
end

p big_shoe_rebounds
