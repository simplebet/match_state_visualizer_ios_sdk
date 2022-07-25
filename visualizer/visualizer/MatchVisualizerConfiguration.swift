//
//  MatchVisualizerConfiguration.swift
//  visualizer
//
//  Created by Francila Weidt Neiva on 12/07/22.
//

import UIKit

public class MatchVisualizerConfiguration: NSObject {
    
    public static let LEAGUE_NFL: String = "NFL";

    public static let LEAGUE_CFB: String = "CFB";
    
    
    var width: Int?
    
    var height: Int?
    
    //API Key provided by Simplebet
    var apiKey: String?

    // Either NFL | NBA | MLB | CFB
    var league: String?

    // The away and home teams abbreviations
    var teams: [String]?

    // The UTC Start time of the match
    var startTime: String?
    
    public func setWidth(width: Int) -> MatchVisualizerConfiguration{
        self.width = width;
        return self;
    }

    public func setHeight(height: Int) -> MatchVisualizerConfiguration{
        self.height = height;
        return self;
    }

    public func setLeague(league: String) -> MatchVisualizerConfiguration{
        self.league = league;
        return self;
    }

    public func setStartTime(startTime: String) -> MatchVisualizerConfiguration{
        self.startTime = startTime;
        return self;
    }

    public func setAPIKey(apiKey: String) -> MatchVisualizerConfiguration{
        self.apiKey = apiKey;
        return self;
    }
        
    public func setTeams(teams: [String]) -> MatchVisualizerConfiguration{
        self.teams = teams;
        return self;
    }

    public func  toUrlParams() -> String {
        var firstTeamID: String = ""
        var secondTeamID: String = ""
        if(self.league == MatchVisualizerConfiguration.LEAGUE_NFL){
            let nfl : Teams.Nfl = Teams.Nfl()
            firstTeamID = nfl.getTeamIdByAbbreviation(abbreviation: teams?[0] ?? "") ?? ""
            secondTeamID = nfl.getTeamIdByAbbreviation(abbreviation: teams?[1] ?? "") ?? ""
            
        }
        
        return "api_key=\(apiKey)&teams=\(firstTeamID))),\(secondTeamID)&start_time=\(startTime)" ;
    }
}
