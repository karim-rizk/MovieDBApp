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

---

## 🧰 Requirements

- [Mint](https://github.com/yonaskolb/Mint)  
  → `brew install mint`  
  → `mint bootstrap` (installs SwiftFormat + SwiftLint)

- A TMDB API Read Access Token  
  → Sign up for a free account at [themoviedb.org](https://www.themoviedb.org/)  
  → Go to **Settings → API → Request an API key**  
  → Copy the "API Read Access Token (v4 auth)"  

  Then create `Configuration/Environment.xcconfig` with:
  ```xcconfig
  TMDB_API_READ_ACCESS_TOKEN = your_tmdb_token_here
  ```
  This file is `.gitignore`d and must be added manually.

---

## 🚀 Getting Started

1. Clone the repository.  
2. Run `mint bootstrap` to install required tools.  
3. Add your TMDB token in `Configuration/Environment.xcconfig`.  
4. Open the project in Xcode and run.  

---

## 🛠 Tooling (Preconfigured)

### 🧼 SwiftFormat (Auto-formatting)
- Config: `.swiftformat`
- Runs automatically as a Pre-action Script in the Xcode Scheme:
```bash
#!/bin/bash
set -euo pipefail
/opt/homebrew/bin/mint run swiftformat . --config .swiftformat
```

### 🧯 SwiftLint (Static Analysis)
- Config: `.swiftlint.yml`
- Runs automatically as a Build Phase in Xcode:
```bash
#!/bin/bash
set -euo pipefail
export PATH="/opt/homebrew/bin:$PATH"

unset SDKROOT
unset TOOLCHAINS
unset SWIFT_INCLUDE_PATHS || true
export DEVELOPER_DIR="$(xcode-select -p)"

cd "${SRCROOT}" || exit 1
mint run realm/SwiftLint swiftlint --config .swiftlint.yml --reporter xcode --quiet || true
touch "${DERIVED_FILE_DIR}/swiftlint-output.txt"
```

---

## 🔐 API Token at Runtime

At runtime, the token is accessed via:

```swift
enum AppEnvironment {
    static var tmdbToken: String {
        guard let token = Bundle.main.object(forInfoDictionaryKey: key) as? String, token.hasPrefix("eyJ") else {
        fatalError("❌ '\(key)' is missing or invalid. Ensure it's injected via .xcconfig and Build Settings.")
        }
        return token
    }

    private static let key = "TMDB_API_READ_ACCESS_TOKEN"
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
