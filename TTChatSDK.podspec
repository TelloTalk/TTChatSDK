Pod::Spec.new do |s|
    s.name           = 'TTChatSDK'
    s.version        = '0.0.2'
    s.summary        = 'Corporate Chat SDK and UI for iOS Devs'
    s.homepage       = 'https://tilismtechservices.com/sdkportal/'
    s.license        = { :type => 'MIT' }
    s.author         = { 'Huda Jawed' => 'hudajawed18@gmail.com' }
    s.source = { :http => 'https://github.com/TelloTalk/TTChatSDK/releases/download/0.0.2/TTChatSDK.zip' }

    s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.swift_version = '5.5'
    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'TTChatSDK/TTChatSDK.xcframework'
    s.dependency "RealmSwift","~> 20.0.2"
    s.dependency "SwiftyJSON"
    s.dependency "SDWebImage"
    s.dependency "SocketIO"
end
