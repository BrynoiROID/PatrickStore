# Uncomment the next line to define a global platform for your project
  platform :ios, '12.3'
target 'PatricksStore' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PatricksStore
  pod 'SkyFloatingLabelTextField', '4.0.0'
  pod 'IQKeyboardManagerSwift', '6.5.6'
  pod 'SVPinView', '1.0.11'
  pod 'GoogleMaps'
  pod 'ImageSlideshow', '1.9.2'
  pod "ImageSlideshow/Kingfisher"
  pod 'Kingfisher','~> 6.3.1'
  pod 'Cosmos', '23.0.0'
  pod 'SideMenu', '6.5.0'
  pod 'Alamofire', '~> 5.1'
  pod 'GooglePlaces'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
      end
    end
  end
