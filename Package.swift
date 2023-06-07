// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyKituraApp",
    dependencies: [
        .package(url: "https://github.com/Kitura/Kitura", from: "3.0.0"),
        .package(url: "https://github.com/Kitura/HeliumLogger.git", from: "2.0.0")
    ],
    targets: [
        .executableTarget(name: "MyKituraApp", dependencies: [ .target(name: "Application"), "Kitura", "HeliumLogger"]),
        .target(name: "Application", dependencies: [ "Kitura" ])
    ]
)
