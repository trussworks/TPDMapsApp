Pod::Spec.new do |s|
  s.name         = "TPMapsApp"
  s.version      = "1.0.0"
  s.summary      = "A class to help deal with the variety of mapping apps."
  s.description  = <<-DESC
TPMapApp helps you launch the right external mapping application.
                   DESC
  s.homepage     = "https://github.com/tetherpad/TPMapsApp"
  s.license      = 'MIT'
  s.author       = { "Mark Ferlatte" => "mark@tetherpad.com" }
  s.source       = { 
    :git => "git@github.com:tetherpad/TPMapsApp.git", 
    :tag => "1.0.0"
  }
  s.source_files = '*MapsApp.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
end
