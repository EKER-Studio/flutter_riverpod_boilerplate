#!/bin/bash

# Exit immediately if any command exits with a non-zero status
set -e

echo "🧹 [1/4] Cleaning workspace and fetching dependencies..."
flutter clean > /dev/null
flutter pub get > /dev/null

echo "⚙️ [2/4] Running build_runner for code generation..."
dart run build_runner build --delete-conflicting-outputs > /dev/null

echo "🔍 [3/4] Running static code analysis..."
flutter analyze

echo "🧪 [4/4] Executing unit and golden tests..."
flutter test

echo "✅ [SUCCESS] Codebase is in perfect shape. Safe to push!"