// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "mariusseufzer-website",
    products: [
        .executable(
            name: "mariusseufzer-website",
            targets: ["mariusseufzer-website"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "mariusseufzer-website",
            dependencies: ["Publish"]
        )
    ]
)
