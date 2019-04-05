// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JSON",
    products: [
        .library(name: "JSON", targets: ["JSON"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-code/platform.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/codable.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/stream.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
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
