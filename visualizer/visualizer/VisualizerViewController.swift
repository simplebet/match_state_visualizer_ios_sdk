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
            
            guard let visualizerURL = URL(string: "https://thawing-eyrie-36823.herokuapp.com/game_sim/previews/40c84354-f16b-4c1f-b568-7a11012af1a8/index.html?app_version=1&dev_features=auth_bypass%2Cauto_start_timer%2C%2Cno_viz_fsm&display=embedded&route=%2Fvisualizer%2Fnfl%2F61ceac92-6b2b-46b6-95e1-1f6f0bcad89d") else{
                return
            }
            
            visualizerWebView.load(URLRequest(url: visualizerURL))
    }
        
    
    public func refresh(){
        visualizerWebView.reload()
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
