
import UIKit

public class MatchVisualizerConfiguration{
    
    public init(){}
    
    public var environment: String = Environment.PROD;
    
    public var width: Double?
    
    public var height: Double?
    
    //API Key provided by Simplebet
    public var apiKey: String = ""

    // The away and home teams abbreviations
    public var teams: [String] = ["",""]

    // The UTC Start time of the match
    public var startTime: String = ""

    public func  toUrlParams() -> String {
        var teamsForUrl = "";
        if(!teams.isEmpty){
            teamsForUrl = "teams=\(teams[0]),\(teams[1])";
        }
        return "api_key=\(apiKey)&teams=\(teamsForUrl)&start_time=\(startTime)" ;
    }
    
    public func toUrl() -> String{
        var url: String
        url = "https://matchviz" + environment + ".simplebet.io/";
        if (environment == Environment.DEV) {
            url = "http://10.0.2.2:8080/";
        }
        return url + "?" + toUrlParams();
    }
    

}
