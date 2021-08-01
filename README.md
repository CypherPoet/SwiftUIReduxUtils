# SwiftUI Redux Utils

<p>
    <img src="https://img.shields.io/badge/Swift-5.5-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-15.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-15.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-12.0+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-15.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-8.0+-1FD67A.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <img src="https://github.com/CypherPoet/SwiftUIReduxUtils/workflows/Build%20&%20Test/badge.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_A collection utilities for architecting SwiftUI apps in the Redux/Elm style of Reducers, Actions, Side Effects and Middlewares._

<p />


## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/CypherPoet/SwiftUIReduxUtils`.


### Swift Package Manager Projects

You can add `CypherPoetSwiftUIReduxUtils` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(
            name: "CypherPoetSwiftUIReduxUtils",
            url: "https://github.com/CypherPoet/SwiftUIReduxUtils",
            .upToNextMinor(from: "0.3.0")
        ),
    ],
    //...
)
```

From there, refer to the `SwiftUIReduxUtils` "product" delivered by the `CypherPoetSwiftUIReduxUtils` "package" inside of any of your project's target dependencies:

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
            .product(
                name: "SwiftUIReduxUtils",
                package: "CypherPoetSwiftUIReduxUtils"
            ),
        ],
        ...
    ),
    ...
]
```

Then simply `import SwiftUIReduxUtils` wherever you’d like to use it.


## Usage

The goal of these utilities is to serve as _primitives_ for architecting SwiftUI apps in the [Redux](https://redux.js.org/)/[Elm](https://guide.elm-lang.org/architecture/) style of Reducers, Actions, Side Effects and Middlewares.

[Version 0.2.2](https://github.com/CypherPoet/SwiftUIReduxUtils/tree/f9caa47ff8fcd19db61b91737e80183f46050a09/Examples/ExampleApp) had an example application that demonstrated this, but it's no longer functional after `0.3.0`'s concurrency refactor. That said, until I get a new example in place, it could still be useful to look through to some extent.

<!-- 🔑 Check out the main [Example App](./Examples/ExampleApp) to see how it [composes different types of app `State` into an app `Store`](https://github.com/CypherPoet/CypherPoetSwiftUIReduxUtils/blob/57cbb225c896181083972a298d8952e8feb14826/Examples/ExampleApp/Shared/Data/State/AppState.swift#L16), [initializes a root store as a `@StateObject`](https://github.com/CypherPoet/CypherPoetSwiftUIReduxUtils/blob/cfd2fd05223f558ea9ee9657361e57f71e600372/Examples/ExampleApp/Shared/ExamplesApp.swift#L13) and [injects](https://github.com/CypherPoet/CypherPoetSwiftUIReduxUtils/blob/cfd2fd05223f558ea9ee9657361e57f71e600372/Examples/ExampleApp/Shared/ExamplesApp.swift#L26) it into [into views](https://github.com/CypherPoet/CypherPoetSwiftUIReduxUtils/blob/57cbb225c896181083972a298d8952e8feb14826/Examples/ExampleApp/Shared/Scene%20Views/AsyncSideEffectExample.swift#L13) as an `@EnvironmentObject`, and then [sends actions to the store](https://github.com/CypherPoet/CypherPoetSwiftUIReduxUtils/blob/57cbb225c896181083972a298d8952e8feb14826/Examples/ExampleApp/Shared/Scene%20Views/AsyncSideEffectExample.swift#L85) as a response to events in the UI. -->



## Contributing

There aren't many to-dos here at the moment, but feedback and suggestions are certainly not discouraged. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.


## Developing

### Requirements

- Xcode 13.0+


### 📜 Creating & Building Documentation

Documentation is built with [Xcode's DocC](https://developer.apple.com/documentation/docc). See [Apple's guidance on how to build, run, and create DocC content](https://developer.apple.com/documentation/docc/api-reference-syntax).

For now, the best way to view the docs is to open the project in Xcode and run the `Build Documentation` command. At some point in the future, I'm hoping to leverage the tooling the develops for generating/hosting DocC documentation. (Please feel free to let me know if you have any ideas or tooling recommendations around this 🙂).


## Acknowledgments

This project wouldn't be possible without several enlightening projects, articles, and tutorials by others in the Swift community who latched onto using these patterns in SwiftUI. Here are just a few of its main inspirations:

- [Redux-like state container in SwiftUI](https://swiftwithmajid.com/2019/09/18/redux-like-state-container-in-swiftui/) by [@mecid](https://github.com/mecid).
- [Redux-like architecture with SwiftUI](https://danielbernal.co/redux-like-architecture-with-swiftui-basics/) by [@afterxleep](https://github.com/afterxleep).
- [SwiftUI-Redux](https://github.com/kitasuke/SwiftUI-Redux) by [@kitasuke](https://github.com/kitasuke).
- [The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)


## License

`CypherPoetSwiftUIReduxUtils` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
