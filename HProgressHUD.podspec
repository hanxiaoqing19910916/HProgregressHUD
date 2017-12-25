#
# Be sure to run `pod lib lint HProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HProgressHUD'
  s.version          = '0.1.0'
  s.summary          = 'HProgressHUD'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HProgressHUD is an Mac Os drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread.
                       DESC

  s.homepage         = 'https://github.com/190658047@qq.com/HProgressHUD'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '190658047@qq.com' => '190658047@qq.com' }
  s.source           = { :git => '', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.osx.deployment_target = "10.10"

  s.source_files = 'HProgressHUD/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HProgressHUD' => ['HProgressHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
