# 📱 MovieDBApp

MovieDBApp is a SwiftUI-based portfolio project showcasing senior-level iOS practices: MVVM, Combine, dependency injection, `.xcconfig`-based secrets, and static tooling.

---

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
- Triggered via Build Phase:
```bash
/opt/homebrew/bin/mint run swiftlint --config .swiftlint.yml --quiet --reporter xcode
```

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

Access at runtime:

```swift
Bundle.main.object(forInfoDictionaryKey: "TMDB_API_READ_ACCESS_TOKEN")
```

---

## 🎥 Powered by TMDB

This app uses the TMDB API but is **not endorsed or certified** by TMDB.

<p align="left">
  <img src="Assets/tmdb-logo.svg" alt="TMDB Logo" width="180"/>
</p>
