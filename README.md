# 📱 MovieDBApp

MovieDBApp is a SwiftUI-based portfolio project showcasing senior-level iOS practices: MVVM, Combine, dependency injection, `.xcconfig`-based secrets, and static tooling.

---

## 🚧 Project Status

Currently implemented:
- Fetching popular movies from TMDB
- Infinite scrolling with clean pagination
- `.xcconfig`-based secret injection
- Static tooling (SwiftFormat, SwiftLint, SwiftGen)
- MVVM + DI architecture

Planned features:
- Movie search
- Detailed movie view (trailers, reviews, etc.)
- Save favorites locally with persistence

## 🧰 Requirements

- [Mint](https://github.com/yonaskolb/Mint)  
  → `brew install mint`  
  → `mint bootstrap` (installs SwiftFormat + SwiftLint)

---

## 🧼 SwiftFormat (Auto-formatting)

- Config: `.swiftformat`
- Runs as Pre-action Script (Xcode Scheme)
- Script path: `Scripts/format.sh`

```bash
#!/bin/bash
set -euo pipefail
/opt/homebrew/bin/mint run swiftformat . --config .swiftformat
```

---

## 🧯 SwiftLint (Static Analysis)

- Config: `.swiftlint.yml`
- Triggered via an Xcode Build Phase:

```bash
#!/bin/bash
set -euo pipefail
export PATH="/opt/homebrew/bin:$PATH"

unset SDKROOT
unset TOOLCHAINS
unset SWIFT_INCLUDE_PATHS || true
export DEVELOPER_DIR="$(xcode-select -p)"

cd "${SRCROOT}" || exit 1

# Run the already-installed SwiftLint
mint run realm/SwiftLint swiftlint --config .swiftlint.yml --reporter xcode --quiet || true

touch "${DERIVED_FILE_DIR}/swiftlint-output.txt"

---

## 🔐 API Token (Required)

Create a file at:

```
Configuration/Environment.xcconfig
```

Add:

```xcconfig
TMDB_API_READ_ACCESS_TOKEN = your_tmdb_token_here
```

❗️**Note**: This file is `.gitignore`d and must be added manually.

At runtime, the token is accessed via:

```swift
enum AppEnvironment {
    static var tmdbToken: String {
        guard let token = Bundle.main.object(forInfoDictionaryKey: "TMDB_API_READ_ACCESS_TOKEN") as? String else {
            fatalError("❌ API token missing – check your .xcconfig and Build Settings.")
        }
        return token
    }
}
```

---

## 🎥 Powered by TMDB

This app uses the TMDB API but is **not endorsed or certified** by TMDB.

<p align="left">
  <img src="Assets/tmdb-logo.svg" alt="TMDB Logo" width="180"/>
</p>

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE) – you are free to use, modify, and distribute it with attribution.
