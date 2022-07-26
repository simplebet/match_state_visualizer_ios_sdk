Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name = "visualizer"
  s.summary = "Match Visualizer iOS"
  s.requires_arc = true
  
  # 2
  s.version = "0.9"
  
  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }
  
  # 4 - Replace with your name and e-mail address
  s.author = { "FranWeidt" => "fran.weidt@gmail.com" }
  
  # 5 - Replace this URL with your own GitHub page's URL (from the address bar)
  s.homepage = "https://github.com/SimpleBet/match_state_visualizer_ios_sdk"
  
  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/SimpleBet/match_state_visualizer_ios_sdk.git",
  :tag => "#{s.version}" }
  
  # 7 COLOQUE AQUI TODAS AS BIBLIOTECAS NATIVAS QUE FOR USAR
  s.framework = "UIKit"
  s.framework = "WebKit"
  
  # 8
  s.source_files = "visualizer/**/*.{swift}"
  
  # 9
  s.resources = "visualizer/**/*.xib"
  
  # 10
  s.swift_version = "5.0"
  
  end