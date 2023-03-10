Pod::Spec.new do |s|
    s.name           = 'TTChatSDK'
    s.version        = '2.0.5'
    s.summary        = 'Corporate Chat SDK and UI for iOS Devs'
    s.homepage       = 'https://tilismtechservices.com/sdkportal/'
    s.license        = { :type => 'MIT' }
    s.author         = { 'Huda Jawed' => 'hudajawed18@gmail.com' }
    s.source         = { :http => 'https://mujtabaimages.s3.ap-south-1.amazonaws.com/TTChatSDK/ios/2.0.5/pod/TTChatSDK.zip'}

    s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.swift_version = '5.5'
    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'TTChatSDK/TTChatSDK.xcframework'
    s.dependency "Realm","~> 10.20.1"
    s.dependency "RealmSwift","~> 10.20.1"
    s.dependency "Alamofire","~> 4.8.2"
    s.dependency "MBProgressHUD","~> 1.1.0"
    s.dependency "SwiftyJSON"
    s.dependency "SDWebImage"
end
