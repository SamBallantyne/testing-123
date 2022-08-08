// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "EventIdProvider",
    products: [
        .library(name: "EventIdProvider", targets: ["EventIdProvider"]),
    ],
    targets: [
        .target(
            name: "EventIdProvider",
            dependencies: []),
    ]
)
