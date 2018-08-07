// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Schedule-Server",
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.3"),
        .package(url:"https://github.com/PerfectlySoft/Perfect-MongoDB.git", from: "3.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.1.0"),
        ],
    targets: [
        .target(
            name: "Schedule-Server",
            dependencies: ["PerfectHTTPServer", "PerfectMongoDB", "SwiftProtobuf"],
            path: "Sources"),
        ]
)
