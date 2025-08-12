// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SPJ",
    platforms: [.iOS(.v13)], // adjust
    products: [
        .library(name: "SPJ", targets: ["SPJ"])
    ],
    targets: [
        .target(name: "SPJ", dependencies: ["SPJBinary"]),
        .binaryTarget(name: "SPJBinary", path: "Binaries/SPJ.xcframework")
    ]
)
