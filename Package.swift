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
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .exact("5.0.1")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .exact("5.19.1")),
        .package(url: "https://github.com/socketio/socket.io-client-swift", .revision("175da8b"))
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
                .byName(name: "SwiftyJSON", condition: .when(platforms: [.iOS])),
                .byName(name: "SDWebImage", condition: .when(platforms: [.iOS])),
                .product(name: "SocketIO", package: "socket.io-client-swift")
                
            ],
            path: "SwiftPM-PlatformExclude/TTChatSDKWrapper",
            exclude: []),
        .binaryTarget(
            name: "TTChatSDK",
            url: "https://github.com/TelloTalk/TTChatSDK/releases/download/2.6.2/TTChatSDK.xcframework.zip",
            checksum: "3ca72195eb21f58745a2a6ae67fdba04e2b2ced07c4e425ca1907abfb4f7631e")
        
    ]
)
