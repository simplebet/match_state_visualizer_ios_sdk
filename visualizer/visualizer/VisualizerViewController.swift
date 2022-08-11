
import UIKit
import WebKit

public class VisualizerViewController: UIViewController {
   
    var visualizerWebView: WKWebView!
    
    public var matchVisualizerConfiguration: MatchVisualizerConfiguration
    
    
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
        config.preferences.javaScriptEnabled = true
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "hostApp")
        config.userContentController = userContentController
   
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        
        visualizerWebView = WKWebView(frame: CGRect(x:  0 , y: 0, width: Int(screenWidth), height: Int(screenWidth * (70.0 / 120.0))), configuration: config)
  
        view.addSubview(visualizerWebView)
        
        setMatchConfiguration(configuration: matchVisualizerConfiguration)
        
    }
        
    public func setMatchConfiguration( configuration: MatchVisualizerConfiguration) -> Void{
        guard let visualizerURL = URL(string: configuration.toUrl()) else{
            return
        }
        
        visualizerWebView.load(URLRequest(url: visualizerURL))
    }

    public func refresh(){
        visualizerWebView.reload()
    }

    public func sendAnalytics(event: String , params: [String:String] ){
        print("event \(event) params \(params)")
        var paramsAsJson: String = "{";
        for (k, v) in params {
            paramsAsJson.append("\'\(k)\':\'\(v)\'");
        }
        paramsAsJson.append("}");
        visualizerWebView.evaluateJavaScript(
                   "postMessage({'analytics': {'event': '\(event)', 'params':\(paramsAsJson) } } )", completionHandler: nil)
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
