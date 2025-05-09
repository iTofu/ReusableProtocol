#
# Be sure to run `pod lib lint ReusableProtocol.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReusableProtocol'
  s.version          = '0.2.0'
  s.summary          = 'A helpful and pure Swift implemented library for registering and reusing cells or views in the table view and collection view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       🎏 ReusableProtocol is a helpful and pure Swift implemented library for registering and reusing cells or views in the table view and collection view. You may never care about what the reuse identifier is.
                       DESC

  s.homepage         = 'https://github.com/iTofu/ReusableProtocol'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leo' => 'leodaxia@gmail.com' }
  s.source           = { :git => 'https://github.com/iTofu/ReusableProtocol.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/leodaxia'

  s.swift_version = "4.2"
  # s.swift_versions = [4.0, 4.2, 5.0]

  s.ios.deployment_target = '9.0'

  s.source_files = 'ReusableProtocol/Classes/**/*'

  # s.resource_bundles = {
  #   'ReusableProtocol' => ['ReusableProtocol/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
