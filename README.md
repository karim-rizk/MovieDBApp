# 📱 MovieDBApp

MovieDBApp is a SwiftUI-based portfolio project demonstrating senior-level iOS development patterns, including modular MVVM architecture, Combine, dependency injection, and static tooling enforcement with SwiftFormat and SwiftLint.

---

## ✅ Linting & Formatting Setup

This project integrates **SwiftFormat** and **SwiftLint** using [Mint](https://github.com/yonaskolb/Mint) to ensure consistent versions and reproducible builds.

---

### 📦 Dependencies

Install Mint (if not already available):

```bash
brew install mint
```

Run the following to install the required tools defined in `Mintfile`:

```bash
mint bootstrap
```

---

### 🧼 SwiftFormat – Auto-Formatting

SwiftFormat is run **automatically before build** using an Xcode **Pre-action Script**.

- Configuration file: `.swiftformat`
- Script path: `Scripts/format.sh`
- Execution: From `${SRCROOT}` to ensure relative resolution

#### ✅ Pre-action Script (Xcode Scheme):
```bash
cd "${SRCROOT}" || exit 1
./Scripts/format.sh
```

#### `Scripts/format.sh`:
```bash
#!/bin/bash
set -euo pipefail

MINT_BIN="/opt/homebrew/bin/mint"

if [ ! -x "$MINT_BIN" ]; then
  echo "🚨 Mint not found at $MINT_BIN. Please install Mint."
  exit 1
fi

echo "🧼 Running SwiftFormat with project configuration..."
$MINT_BIN run swiftformat . --config .swiftformat
echo "✅ SwiftFormat completed successfully."
```

---

### 🧯 SwiftLint – Static Analysis

SwiftLint is integrated as an **Xcode Run Script Build Phase**.

- Configuration file: `.swiftlint.yml`
- Output uses `--reporter xcode` for inline Xcode diagnostics
- Output touch file avoids unnecessary re-execution

#### ✅ Build Phase Script:
```bash
if [ -x /opt/homebrew/bin/mint ]; then
  cd "${SRCROOT}" || exit 1
  /opt/homebrew/bin/mint run swiftlint \
    --config .swiftlint.yml \
    --quiet \
    --reporter xcode
  touch "${DERIVED_FILE_DIR}/swiftlint-output.txt"
else
  echo "⚠️ Mint not found. Skipping SwiftLint."
fi
```

---

## 🧪 Verification

To validate tools are correctly installed:

```bash
mint run swiftformat --version
mint run swiftlint --version
```

---

## 💡 Summary

| Tool        | Purpose             | Run Location       | Config File         |
|-------------|---------------------|--------------------|---------------------|
| SwiftFormat | Auto-formatting     | Pre-action script  | `.swiftformat`      |
| SwiftLint   | Static analysis     | Xcode build phase  | `.swiftlint.yml`    |
| Mint        | Version pinning     | Global CLI install | `Mintfile`          |

This setup ensures **build reproducibility**, **code quality**, and **maintainability** across teams and CI pipelines.
