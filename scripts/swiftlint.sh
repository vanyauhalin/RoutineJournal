BIN=${PWD}/Pods/SwiftLint/swiftlint
if which $BIN >/dev/null; then
  $BIN
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
