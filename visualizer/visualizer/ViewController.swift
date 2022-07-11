//
//  ViewController.swift
//  visualizer
//
//  Created by Francila Weidt Neiva on 11/07/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let visualizerWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(visualizerWebView)
        
        guard let visualizerURL = URL(string: "https://simplebet.io/") else{
            return
        }
        
        visualizerWebView.load(URLRequest(url: visualizerURL))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        visualizerWebView.frame = view.bounds
    }


}
