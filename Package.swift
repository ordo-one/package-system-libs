// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "package-system-libs",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "lz4",
            targets: ["lz4"]
        ),
    ],
    targets: [
        .target(
            name: "SystemLibs",
            dependencies: ["lz4"]
        ),
        .systemLibrary(
            name: "lz4",
            pkgConfig: "liblz4",
            providers: [.apt(["liblz4-dev"]), .brew(["lz4"])]
        ),
    ]
)
