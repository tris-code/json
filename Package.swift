// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JSON",
    products: [
        .library(name: "JSON", targets: ["JSON"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/platform.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/codable.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/stream.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            .branch("master")),
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
