#
# Be sure to run `pod spec lint ZFHaversine.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "ZFHaversine"
  s.version      = "0.1"
  s.summary      = "Objective-C implementation of the Haversine formula."
  s.homepage     = "https://github.com/flightblog/ZFHaversine"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Steve Foster" => "foster@flightblog.org" }
  s.source       = { :git => "https://github.com/flightblog/ZFHaversine.git", :tag => "0.1" }
  s.platform     = :ios
  s.source_files = 'ZFHaversine', 'ZFHaversine/**/*.{h,m}'
end
