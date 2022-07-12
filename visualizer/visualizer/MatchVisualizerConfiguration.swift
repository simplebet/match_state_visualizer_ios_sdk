//
//  MatchVisualizerConfiguration.swift
//  visualizer
//
//  Created by Francila Weidt Neiva on 12/07/22.
//

import UIKit

public class MatchVisualizerConfiguration: NSObject {
    
    public var width: Int?
    
    public var height: Int?
    
    //API Key provided by Simplebet
    public var apiKey: String?

    // Either NFL | NBA | MLB | CFB
    public var league: String?

    // The away and home teams abbreviations
    public var teams: [String]?

    // The UTC Start time of the match
    public var startTime: String?

    public func  toUrlParams() -> String {
        return ""
    }
}
