Pod::Spec.new do |s|

  s.name         = "MHPhotoBroswer"
  s.version      = "0.0.1"
  s.summary      = "MHPhotoBroswer."
  s.description  = "PhotoBroswer for music home "
  s.homepage     = "https://github.com/hengyangKing/MHPhotoBroswer"
  s.license      = "MIT"
  s.author             = { "hengyangKing" => "hengyangKing.yeah.net" }

  s.ios.deployment_target = "8.0"
  
  s.source       = { :git => "https://github.com/hengyangKing/MHPhotoBroswer.git", :tag => "#{s.version}" }

  s.source_files  = "MHPhotoBroswer", "MHPhotoBroswer/**/*.{h,m,xib}"
  
  s.requires_arc = true

  s.dependency "MHCoreSDWebImage"
  s.dependency "MHCoreSVP"
  s.dependency "KingBaseCategory"
  s.dependency "LFRoundProgressView"

  s.resources = "MHPhotoBroswer/Resource/PB.bundle"


  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

 
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }


end
