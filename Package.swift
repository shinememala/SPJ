// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swift-tools-version: 6.1
// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SPJ",
    platforms: [
        .iOS(.v13) // adjust as needed
    ],
    products: [
        .library(
            name: "SPJ",
            targets: ["SPJ"]
        ),
    ],
    targets: [
        // Wrapper target that your clients will import (`import SPJ`)
        // It depends on the binary below.
        .target(
            name: "SPJ",
            dependencies: ["SPJBinary"]
        ),

        // Binary target pointing to the xcframework inside the repo
        .binaryTarget(
            name: "SPJBinary",
            path: "Binaries/SPJ.xcframework"
        ),

        .testTarget(
            name: "SPJTests",
            dependencies: ["SPJ"]
        ),
    ]
)
