
Pod::Spec.new do |s|
  s.homepage    = "https://github.com/haawa799/StrokeDrawingView/tree/master"
  s.name        = "StrokeDrawingView"
  s.version     = "0.1.1"
  s.summary     = "StrokeDrawingView allows you to display stroke-by-stroke drawing. All you need to provide is and array of UIBezierPath."
  s.license     = { :type => "MIT" }
  s.authors     = { "Andriy Kharchyshyn" => "haawaplus@gmail.com" }
  s.screenshot  = "http://cl.ly/image/312l0d3n1A1Z/ezgif.com-gif-maker.gif"

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/haawa799/StrokeDrawingView.git", :tag => "v0.1.1" }
  s.source_files = 'Pod/Classes/**/*'
end