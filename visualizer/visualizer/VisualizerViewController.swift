//
//  VisualizerViewController.swift
//  visualizer
//
//  Created by Francila Weidt Neiva on 11/07/22.
//

import UIKit
import WebKit

public class VisualizerViewController: UIViewController {
    
    var visualizerWebView = WKWebView()
    
    
    var matchVisualizerConfiguration: MatchVisualizerConfiguration
    
    
    public init(matchVisualizerConfiguration: MatchVisualizerConfiguration) {
        self.matchVisualizerConfiguration = matchVisualizerConfiguration
        super.init(nibName: "VisualizerViewController", bundle: Bundle(for: VisualizerViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        let config = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "hostApp")
        config.userContentController = userContentController
   
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width

        
        visualizerWebView = WKWebView(frame: CGRect(x:  0 , y: 0, width: Int(screenWidth), height: Int(screenWidth * (70.0 / 120.0))), configuration: config)
  
        
        view.addSubview(visualizerWebView)
            
        guard let visualizerURL = URL(string: "https://matchviz.staging.simplebet.io/?dev_features=auth_bypass&proxy=thawing-eyrie-36823.herokuapp.com/proxy/match_visualizer&route=/visualizer/nfl/61ceac92-6b2b-46b6-95e1-1f6f0bcad89d") else{
            return
        }
        
        visualizerWebView.load(URLRequest(url: visualizerURL))
    }
        
    
    public func refresh(){
        visualizerWebView.reload()
    }
    
    public func sendAnalytics(event: String , params: String ){
        visualizerWebView.evaluateJavaScript(
                   "postMessage({'analytics': {'event': '\(event)', 'params':{\(params)} } })", completionHandler: nil)
    }

}

extension VisualizerViewController: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.name)
        if message.name == "refreshPage"{
            refresh()
        }
    }

}
