#
#  Be sure to run `pod spec lint FantasyUI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "FantasyUI"
  s.version      = "1.0.11"
  s.summary      = "FantasyUI 金诚所至，金石为开.FantasyUI 金诚所至，金石为开.FantasyUI 金诚所至，金石为开.FantasyUI 金诚所至，金石为开.FantasyUI 金诚所至，金石为开."


  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  "金诚所至，金石为开。"
                   DESC

  s.homepage     = "https://github.com/liseami/FantasyUI"
 
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = { :type => "MIT", :file => "LICENSE" }
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "liseami" => "liseami@qq.com" }
  # Or just: spec.author    = "liseami"
  # spec.authors            = { "liseami" => "51239614+liseami@users.noreply.github.com" }
  s.social_media_url   = "https://twitter.com/liseami"
  s.source           = {
    :git => 'https://github.com/liseami/FantasyUI.git',
    # :tag => s.version.to_s,
    :submodules => true
  }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  # s.platform     = :ios, "14.1"


  #  When using multiple platforms
  s.ios.deployment_target = "14.1"
  s.swift_version = '5.3'
  s.frameworks = 'Combine', 'SwiftUI'
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"
  # 框架要求ARC环境下使用
  s.requires_arc = true
  # 每次都参与编译方便修改时
  s.static_framework = true



  s.source_files  = "*.swift","FantasyUI","FantasyUI/**/*.swift", "FantasyUI/**/*.{h,m}"
  s.exclude_files = "FantasyUI/Exclude"
  s.public_header_files = "FantasyUI/**/*.h"
  
  s.dependency "lottie-ios"
  

  # 网络请求 数据解析
    s.subspec 'Networking' do |ss|
    ss.source_files = 'FantasyUI/Networking/**/*.swift'

    ss.dependency "Moya"
    ss.dependency "Moya/Combine", '~> 15.0'
    ss.dependency "KakaJSON"
    ss.dependency "SwiftyJSON"



  end

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #


  # s.source = { :git => 'https://github.com/liseami/FantasyUI.git'}

# s.source = { :git => 'https://github.com/liseami/FantasyUI.git', :tag => "#{s.version}" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #



  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
