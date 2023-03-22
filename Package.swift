// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TTChatSDKSwiftPackage",
    platforms: [.iOS(.v12)],
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "TTChatSDK", targets: ["TTChatSDKSwiftPackageTarget"])
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.4")),
        .package(url: "https://github.com/jdg/MBProgressHUD.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/realm/realm-swift.git", .exact("10.20.1")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .exact("5.0.1")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .exact("5.14.3"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on otxher targets in this package, and on products in packages this package depends on.
        .target(
            name: "TTChatSDKSwiftPackageTarget",
            dependencies: [.target(name: "TTChatSDKSwiftPackageWrapper",
                                   condition: .when(platforms: [.iOS]))],
            path: "SwiftPM-PlatformExclude/TTChatSDKTarget"
        ),
        .target(
            name: "TTChatSDKSwiftPackageWrapper",
            dependencies: [
                .target(name: "TTChatSDK",
                        condition: .when(platforms: [.iOS])),
                .byName(name: "Alamofire", condition: .when(platforms: [.iOS])),
                "MBProgressHUD",
                .byName(name: "SwiftyJSON", condition: .when(platforms: [.iOS])),
                .byName(name: "SDWebImage", condition: .when(platforms: [.iOS])),
                .product(name: "RealmSwift", package: "realm-swift")
                
            ],
            path: "SwiftPM-PlatformExclude/TTChatSDKWrapper",
            exclude: []),
        .binaryTarget(
            name: "TTChatSDK",
            url: "https://mujtabaimages.s3.ap-south-1.amazonaws.com/TTChatSDK/ios/2.5.1/spm/TTChatSDK.xcframework.zip",
            checksum: "dd6763ed7a5609127debb0d40ccf76de79a8cc013dab7764e183c3017258e75e")
        
    ]
)
