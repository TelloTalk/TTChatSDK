Pod::Spec.new do |s|
    s.name           = 'TTChatSDK'
    s.version        = '2.6.1'
    s.summary        = 'Corporate Chat SDK and UI for iOS Devs'
    s.homepage       = 'https://tilismtechservices.com/sdkportal/'
    s.license        = { :type => 'MIT' }
    s.author         = { 'Huda Jawed' => 'hudajawed18@gmail.com' }
    s.source         = { :http => 'https://ttsdk-release.s3.eu-west-1.amazonaws.com/ios/2.6.1/pod/TTChatSDK.zip'}

    s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.swift_version = '5.5'
    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'TTChatSDK/TTChatSDK.xcframework'
    s.dependency "Realm","~> 10.20.1"
    s.dependency "RealmSwift","~> 10.20.1"
    s.dependency "SwiftyJSON"
    s.dependency "SDWebImage"
    s.dependency "SocketIO"
end
