// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .unsafeFlags([
        "-strict-concurrency=complete",
    ]),
]

let package = Package(
    name: "SampleAppLib",
    // プラットフォームを指定する
    platforms: [.iOS("17.0")],
    products: [
        
        .library(
            name: "SampleAppLib",
            targets: [
                "AppMain",
                "View"
            ]),
    ],
    dependencies: [
        // 依存させるパッケージをここに記載
        // .package(
        //     url: "https://github.com/SwiftGen/SwiftGenPlugin",
        //     from: "6.6.2"
        // ),
    ],
    targets: [
        // アプリケーション本体の実装のRootになるものとかをここに実装すると良い、例えばAppDelegateとか　Appとか
        // dependenciesに依存させたいものを記載、基本的にそこで使うものを依存させる。
        .target(
            name: "Common",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "Domain",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "AppMain",
            dependencies: [
                "View"
            ],
            swiftSettings: swiftSettings
        ),
        .target(
            name: "View",
            dependencies: [],
            swiftSettings: swiftSettings,
            plugins: [
                // .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
            ]
        ),
        .testTarget(
            name: "SampleAppLibTests",
            dependencies: []),
    ]
)
