// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InsuideNavigation",
    platforms: [.iOS(.v14)],
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "InsuideNavigation",
            targets: ["InsuideNavigation"]),
    ],
    dependencies: [.package(url: "https://github.com/IndoorAtlas/ios-spm.git", exact: "3.6.9"),
                   .package(url: "https://github.com/mapbox/mapbox-maps-ios.git", exact: "11.6.0"),
                   .package(url: "https://github.com/SDWebImage/SDWebImage.git", exact: "5.19.7")
                  ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "InsuideNavigation",
            dependencies: [
                           .product(name: "MapboxMaps",package: "mapbox-maps-ios"),
                           .product(name: "IndoorAtlas",package: "ios-spm"),
                           .product(name: "SDWebImage",package: "SDWebImage")]
                         ),
        .testTarget(
            name: "InsuideNavigationTests",
            dependencies: ["InsuideNavigation"]),
            .binaryTarget(name: "InsuideIndoorNavigation", path: "./Sources/InsuideIndoorNavigation.xcframework")
    ]
)
