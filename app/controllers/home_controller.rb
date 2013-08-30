class HomeController < ApplicationController

  def index
    s = SteamRequest.new
    @profile = JSON.parse(s.get('ISteamUser', 'GetPlayerSummaries', 'v0002', true).body)
    @recentlyplayed = JSON.parse(s.get('IPlayerService', 'GetRecentlyPlayedGames', 'v0001', false).body)
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
