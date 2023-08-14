#
# Be sure to run `pod lib lint JayRKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JayRKit'
  s.version          = '0.1.0'
  s.summary          = 'A Fully Function with iOS platform which will help you create APP'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    A clean and customizable photo gallery view controller for iOS. Allows app developers to easily display beautiful photo galleries in their apps. Includes features like customizable layouts, pinch to zoom, swipe to dismiss, delete photos, etc. Designed to make it simple for developers to add a great photo gallery experience. Focused on performance, customization and ease of use.
    DESC

  s.homepage         = 'https://github.com/jaySun-ch/JayRKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jaySun-ch' => 'szhixiong2022@163.com' }
  s.source           = { :git => 'https://github.com/jaySun-ch/BRKit/blob/main/BRKit/Source/BRExtension/UIView%2BBRExtension.m', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.user_target_xcconfig = {
    'GENERATE_INFOPLIST_FILE' => 'YES'
  }

  s.pod_target_xcconfig = {
    'GENERATE_INFOPLIST_FILE' => 'YES'
  }
    
  s.source_files = 'JayRKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JayRKit' => ['JayRKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Masonry', '~> 1.1.0'
end
