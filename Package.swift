// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let lz4URL = "https://api.github.com/repos/ordo-one/mobile-dependencies-xcf/releases/assets/172962359-lz4-1.9.4.xcframework.zip"
let lz4Checksum = "a7de11867ddbf8ea66ec245a95af6798137595d41b8b552e3edd4fcaa9d1331f"

let package = Package(
    name: "package-system-libs",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "lz4",
            targets: ["lz4Libs"]
        ),
    ],

    targets: [
        .target(
            name: "lz4Libs",
            dependencies: [
                .target(name: "lz4", condition: .when(platforms: [.macOS, .linux])),
                .target(name: "lz4ios", condition: .when(platforms: [.iOS])),
            ]
        ),
        .systemLibrary(
            name: "lz4",
            pkgConfig: "liblz4",
            providers: [
                .apt(["liblz4-dev"]),
                .brew(["lz4"]),
            ]
        ),
        .binaryTarget(
            name: "lz4ios",
            url: lz4URL,
            checksum: lz4Checksum
        ),
    ]
)
