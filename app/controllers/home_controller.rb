class HomeController < ApplicationController

  def index
    @steam = SteamUser.new
  end
end

class SteamUser
  
  attr_reader :profile
  attr_reader :recentlyplayed

  def initialize
    s = SteamRequest.new
    @profile = JSON.parse(s.get('ISteamUser', 'GetPlayerSummaries', 'v0002', true).body)["response"]["players"][0]
    @recentlyplayed = JSON.parse(s.get('IPlayerService', 'GetRecentlyPlayedGames', 'v0001', false).body)["response"]["games"]
  end

end

class SteamRequest
  include HTTParty


  # IPLAYERSERVICE  

  # Methods using the IPlayerService API.


  def get(api, method, version, plural)
    # Constants:
    base_uri = "api.steampowered.com"
    format = 'json'
    
    url = "http://" + base_uri + "/"
    url += api + "/" + method + "/" + version + "/"
    url += "?key=" + Figaro.env.STEAM_API_KEY
    url += (plural) ? "&steamids=" : "&steamid="
    url += Figaro.env.STEAM_ID
    url += "&format=" + format

    json = HTTParty.get(url)
  end
end

class GithubUser

  

  def initialize
    
  end
end

class GithubRequest 
  include HTTParty

  def getPublicEvents(user)
    base_uri = "api.github.com"
    
    url = "https://" + base_uri + "/"
    url += "users/" + user + "/events/public"
    
    json = HTTParty.get(url)
  end
end
