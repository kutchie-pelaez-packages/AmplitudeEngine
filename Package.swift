// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "AmplitudeEngine",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "AmplitudeEngine", targets: ["AmplitudeEngine"])
    ],
    dependencies: [
        .package(name: "CoreUtils", url: "https://github.com/kutchie-pelaez-packages/CoreUtils", .branch("master")),
        .package(name: "AnalyticsTracker", url: "https://github.com/kutchie-pelaez-packages/AnalyticsTracker", .branch("master")),
        .package(name: "Amplitude", url: "https://github.com/amplitude/Amplitude-iOS.git", from: "8.3.1")
    ],
    targets: [
        .target(
            name: "AmplitudeEngine",
            dependencies: [
                .product(name: "CoreUtils", package: "CoreUtils"),
                .product(name: "AnalyticsTracker", package: "AnalyticsTracker"),
                .product(name: "AnalyticsEvent", package: "AnalyticsTracker"),
                .product(name: "Amplitude", package: "Amplitude")
            ],
            path: "Sources"
        )
    ]
)
