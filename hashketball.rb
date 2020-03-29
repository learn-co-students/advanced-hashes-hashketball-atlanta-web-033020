# Write your code here!
def game_hash
  final_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [ {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
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
      players: [ {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
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
  
  final_hash  
end

def num_points_scored(name)
  points = nil
  
  game_hash[:home][:players].each do |player|
    points = player[:points] if player[:player_name] == name
  end
  if !points then
    game_hash[:away][:players].each do |player|
      points = player[:points] if player[:player_name] == name
    end
  end

  points = "Player not found" if !points
  points
end

def shoe_size(name)
  size = nil
  
  game_hash[:home][:players].each do |player|
    size = player[:shoe] if player[:player_name] == name
  end
  if !size then
    game_hash[:away][:players].each do |player|
      size = player[:shoe] if player[:player_name] == name
    end
  end

  size = "Player not found" if !size
  size
end

def team_names()
  names = []
  
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  
  names
end

def team_colors(team)
  colors = ""
  
  if team == game_hash[:home][:team_name] then
    colors = game_hash[:home][:colors] else
    colors = game_hash[:away][:colors]
  end
  
  colors
end

def player_numbers(team)
  numbers = []
  
  if team == game_hash[:home][:team_name] 
    then
      game_hash[:home][:players].each do |player|
        numbers << player[:number]
      end
    else
      game_hash[:away][:players].each do |player|
        numbers << player[:number]
      end
  end
  
  numbers
end

def player_stats(name)
  stats = nil
  
  game_hash[:home][:players].each do |player|
    stats = player if player[:player_name] == name
  end
  if !stats then
    game_hash[:away][:players].each do |player|
      stats = player if player[:player_name] == name
    end
  end
  
  stats.delete(:player_name) if stats

  stats = "Player not found" if !stats
  stats
end

def big_shoe_rebounds()
  size = 0
  points = 0
  
  game_hash[:home][:players].each do |player|
    if player[:shoe] > size then
      points = player[:rebounds]
      size = player[:shoe]
    end
  end
  
  game_hash[:away][:players].each do |player|
    if player[:shoe] > size then
      points = player[:rebounds]
      size = player[:shoe]
    end
  end
  
 points 
end








