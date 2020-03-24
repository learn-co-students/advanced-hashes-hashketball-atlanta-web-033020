require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
  hash
end

def num_points_scored(name)
  total_scored = nil
  game_hash.each do |place, team|
    team.each do |key, data|
      if key == :players
        data.each do |player|
          if player[:player_name] == name
          total_scored = player[:points]
          end
        end
      end
    end
  end
  return total_scored
end

def shoe_size(name)
  size = nil
  game_hash.each do |place, team|
    team.each do |key, data|
      if key == :players
        data.each do |player|
          if player[:player_name] == name
          size = player[:shoe]
          end
        end
      end
    end
  end
  return size
end

def team_colors(data)
  team_colors = []
  game_hash.each do |place, team|
    if team[:team_name] == data
      team_colors = team[:colors]
    end
  end
  return team_colors
end

def team_names
  teams_playing = []
  game_hash.each do |place, team|
    teams_playing.push(team[:team_name])
   #binding.pry
  end
  teams_playing
end

def player_numbers(team)
  numbers = []
  game_hash.each do |place, team_hash|
    if team_hash[:team_name] == team
      team_hash.each do |key, data|
        if key == :players
          data.each do |player|
            numbers.push(player[:number])
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats = {}
  game_hash.each do |place, team|
    team.each do |key, data|
      if key == :players
        data.each do |player|
          if player[:player_name] == name
          stats[:number] = player[:number]
          stats[:shoe] = player[:shoe]
          stats[:points] = player[:points]
          stats[:rebounds] = player[:rebounds]
          stats[:assists] = player[:assists]
          stats[:steals] = player[:steals]
          stats[:blocks] = player[:blocks]
          stats[:slam_dunks] = player[:slam_dunks]
          end
        end
      end
    end
  end
  return stats
end

def big_shoe_rebounds
  rebound_total = nil
  biggest_shoe = 0
  game_hash.each do |place, team|
    team.each do |key, data|
      if key == :players
        data.each do |player|
          if shoe_size(player[:player_name]) > biggest_shoe
            biggest_shoe = player[:shoe]
            rebound_total = player[:rebounds]
          end
        end
      end
    end
  end
  rebound_total
end




