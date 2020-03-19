require "pry"

def game_hash
  game_data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },{
        :player_name => "Jason Terry",
        :number =>31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
  
  return game_data
end

def num_points_scored(name)
  hash = game_hash
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each_with_index do |(player_data), index|
      if player_data[:player_name] == name
        return player_data[:points]
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each_with_index do |(player_data), index|
      if player_data[:player_name] == name
        return player_data[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  
  hash.each do |team_side, team_side_values|
    if team_side_values[:team_name] == team_name
      return team_side_values[:colors]
    end
  end
end

def team_names()
  hash = game_hash
  arr = []
  
  hash.each do |team_side, team_side_values|
    arr.push(team_side_values[:team_name])
  end
  return arr
end

def player_numbers(team_name)
  hash = game_hash
  arr = []
  
  hash.each do |team_side, team_side_values|
    if team_side_values[:team_name] == team_name
      team_side_values[:players].each do |player_data|
        arr.push(player_data[:number])
      end
    end
  end
  return arr
end

def player_stats(name)
  hash = game_hash
  player_hash = {}
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each_with_index do |(player_data), index|
      if player_data[:player_name] == name
        player_hash = player_data
      end
    end
  end
  player_hash.delete(:player_name)
  return player_hash
end

def big_shoe_rebounds
  hash = game_hash
  player_hash = {}
  biggest_shoe = 0
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each_with_index do |(player_data), index|
      if player_data[:shoe] > biggest_shoe
        biggest_shoe = player_data[:shoe]
        player_hash = player_data
      end
    end
  end
  return player_hash[:rebounds]
end

def most_points_scored
  hash = game_hash
  
  player_hash = {}
  most_points = 0
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each_with_index do |(player_data), index|
      if player_data[:points] > most_points
        most_points = player_data[:points]
        player_hash = player_data
      end
    end
  end
  return player_hash[:player_name]
end

def winning_team
  hash = game_hash
  team_points = []
  
  hash.each do |team_side, team_side_values|
    points = 0
    team_side_values[:players].each do |player_data|
      points += player_data[:points]
    end
    team_points.push(points)
  end
  team_points
  
  if team_points[0] > team_points[1]
    return hash[:home][:team_name]
  else
    return hash[:away][:team_name]
  end
end

def player_with_longest_name
  hash = game_hash
  
  player_hash = {}
  player_name = ""
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each do |player_data|
      if player_data[:player_name].length > player_name.length
        player_name = player_data[:player_name]
      end
    end
  end
  return player_name
end

def long_name_steals_a_ton?
  hash = game_hash
  steals = 0
  player_most_steals = ""
  
  player = player_with_longest_name
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each do |player_data|
      if player_data[:steals] > steals
        steals = player_data[:steals]
        player_most_steals = player_data[:player_name]
      end
    end
  end
  
  if player == player_most_steals
    return true
  else
    return false
  end
end

def player_by_number(number)
  hash = game_hash
  
  hash.each do |team_side, team_side_values|
    team_side_values[:players].each do |player_data|
      if player_data[:number] == number
        return player_data[:player_name]
      end
    end
  end
end