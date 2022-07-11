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
            visualizerWebView.frame = view.bounds
        }

}
