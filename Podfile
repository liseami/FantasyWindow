# Uncomment the next line to define a global platform for your project

platform :ios, '15.0'

target 'FantasyWindow' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FantasyWindow


pod 'Introspect'
pod 'lottie-ios'
# pod 'CropViewController'
pod 'FloatingPanel'


pod 'UMCommon'
pod 'UMDevice'
pod 'UMCCommonLog'


pod 'FantasyUI', :path => './FantasyUI'

pod 'SDWebImageSwiftUI'

end


post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end