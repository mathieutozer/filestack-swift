// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FilestackSDK",
    platforms: [
      .iOS(.v11),
      .macOS(.v13)
    ],
    products: [
        .library(
            name: "FilestackSDK",
            targets: ["FilestackSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .upToNextMajor(from: Version(9, 0, 0)))
    ],
    targets: [
        .target(
            name: "FilestackSDK",
            dependencies: [],
            resources: [
                .copy("VERSION")
            ]
        ),
        .testTarget(
            name: "FilestackSDKTests",
            dependencies: [
                "FilestackSDK",
                "OHHTTPStubs",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs")
            ],
            resources: [
                .copy("Fixtures"),
                .copy("VERSION")
            ]
        ),
    ]
)
