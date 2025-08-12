// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "SPJ",
    platforms: [
        .iOS(.v14) // set your minimums
    ],
    products: [
        .library(name: "SPJ", targets: ["SPJ"])
    ],
    targets: [
        // Your source target (optional if you also have code)
        .target(
            name: "SPJ",
            dependencies: ["SPJBinary"]
        ),

        // Binary target pointing to the xcframework in the repo
        .binaryTarget(
            name: "SPJBinary",
            path: "Binaries/SPJ.xcframework"
        ),

        .testTarget(
            name: "SPJTests",
            dependencies: ["SPJ"]
        )
    ]
)
