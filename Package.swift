// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "AmplitudeEngine",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "AmplitudeEngine", 
            targets: [
                "AmplitudeEngine"
            ]
        )
    ],
    dependencies: [
        .package(name: "Amplitude", url: "https://github.com/amplitude/Amplitude-iOS.git", from: "8.3.1"),
        .package(name: "Analytics", url: "https://github.com/kutchie-pelaez-packages/Analytics.git", .branch("master")),
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "AmplitudeEngine",
            dependencies: [
                .product(name: "Amplitude", package: "Amplitude"),
                .product(name: "Analytics", package: "Analytics"),
                .product(name: "Core", package: "Core")
            ],
            path: "Sources"
        )
    ]
)
