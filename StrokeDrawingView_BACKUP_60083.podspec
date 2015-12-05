
Pod::Spec.new do |s|
  s.name        = "StrokeDrawingView"
  s.version     = "0.1.0"
  s.summary     = "View which takes array of UIBezierPath as an input. And allows you to display them as stroke-by-stroke drawing."
  s.license     = { :type => "MIT" }
  s.authors     = { "Andriy Kharchyshyn" => "haawaplus@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/haawa799/StrokeDrawingView.git", :tag => "0.1.0"}
  s.source_files = 'Pod/Classes/**/*'
end 