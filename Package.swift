// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReusableProtocol",
    platforms: [
        .iOS(.v11),
        // .macOS(.v10_13),
        // .tvOS(.v11),
        // .watchOS(.v4),
        // .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ReusableProtocol",
            targets: ["ReusableProtocol"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ReusableProtocol",
            path: "ReusableProtocol"
        ),
    ]
)
