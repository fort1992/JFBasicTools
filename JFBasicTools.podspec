#
# Be sure to run `pod lib lint JFBasicTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JFBasicTools'
  s.version          = '0.1.2'
  s.summary          = '基础工具类20191122'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fort1992/JFBasicTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fort1992@163.com' => 'ios' }
  s.source           = { :git => 'https://github.com/fort1992/JFBasicTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JFBasicTools/Classes/**/*'
  s.dependency 'SnapKit'
  s.dependency 'Then'
  s.dependency 'Kingfisher'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'Moya'
  s.dependency 'HandyJSON'
  # s.resource_bundles = {
  #   'JFBasicTools' => ['JFBasicTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
