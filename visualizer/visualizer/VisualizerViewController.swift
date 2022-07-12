//
//  VisualizerViewController.swift
//  visualizer
//
//  Created by Francila Weidt Neiva on 11/07/22.
//

import UIKit
import WebKit

public class VisualizerViewController: UIViewController {
    
    let visualizerWebView = WKWebView()
    
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
            view.addSubview(visualizerWebView)
            
            guard let visualizerURL = URL(string: "https://simplebet.io/") else{
                return
            }
            
            visualizerWebView.load(URLRequest(url: visualizerURL))
        }
        
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = matchVisualizerConfiguration.width ?? 200
        let height = matchVisualizerConfiguration.height ?? 300
        let xPosition = Int(view.frame.width)/2 - width/2
        let yPosition = Int(view.frame.height)/2 - height/2
        visualizerWebView.frame = CGRect(x:  xPosition , y: yPosition, width: width, height: height)
   }

}
