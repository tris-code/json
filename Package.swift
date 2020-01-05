// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JSON",
    products: [
        .library(name: "JSON", targets: ["JSON"])
    ],
    dependencies: [
        .package(path: "../Platform"),
        .package(path: "../Codable"),
        .package(path: "../Stream"),
        .package(path: "../Test")
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
