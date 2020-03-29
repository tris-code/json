// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JSON",
    products: [
        .library(name: "JSON", targets: ["JSON"])
    ],
    dependencies: [
        .package(path: "../platform"),
        .package(path: "../codable"),
        .package(path: "../stream"),
        .package(path: "../test")
    ],
    targets: [
        .target(
            name: "JSON",
            dependencies: ["Platform", "Codable", "Stream"]),
        .testTarget(
            name: "JSONTests",
            dependencies: ["JSON", "Test"])
    ]
)
