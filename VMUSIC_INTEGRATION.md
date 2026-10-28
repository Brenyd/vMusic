# vMusic 1.0.9 — Mornye feature integration

This derivative combines the vMusic 1.0.8 visual identity and Origin Island package identity with the Mornye 5.2.6 playback, library, download, audio, and extension backend.

## Integration choices

- vMusic name, launcher artwork, vivo-red accent (`#F05D56`), black/charcoal surfaces, blue quality metadata, and Home / Local / Repo / Me navigation.
- Origin Island Android application ID: `com.hiby.music`.
- Person-facing version: vMusic `1.0.9` (version code `9`).
- Extension compatibility version: Mornye `5.2.6`, intentionally retained for repository `minAppVersion` checks and the native extension host.
- Local library enabled by default with on-open scanning.
- Mornye update prompts disabled by default so they are not presented as vMusic updates.
- Download folders renamed from `Mornye` to `vMusic`.

## Mornye-compatible extensions

The original native extension engine is retained, including sandbox permissions, metadata/download/lyrics providers, encrypted extension storage, signed sessions, repository update checks, SHA-256 verification, and repository filtering. It accepts `.mornye-ext`, `.spotiflac-ext`, and `.sflx` packages.

The Repo tab accepts a compatible repository containing `registry.json`. Both snake_case and camelCase registry fields remain supported.

## Discord components

The unchanged ARM64 `libmornye_discord.so` and `libdiscord_partner_sdk.so`, plus `Discord-License-Notices.txt`, were retained from the user-supplied Mornye 5.2.6 ARM64 APK. The Discord bridge source and notices remain in `third_party/mornye_discord`. The proprietary Discord Social SDK is not relicensed by the Mornye source license.

## Prebuilt ARM64 backend

For a faster Android-only rebuild, `android/app/src/main/jniLibs/arm64-v8a` contains the unchanged `libmornye_mobile.so` and `libmornye_audio.so` from the supplied Mornye 5.2.6 ARM64 APK. `android/app/src/prebuilt/kotlin` contains the matching UniFFI bridge generated from the unchanged Rust source. Neither the original `libapp.so` nor `libflutter.so` is reused: the vMusic Dart interface and Flutter engine are rebuilt normally.

Set `MORNYE_PREBUILT_NATIVE=1` together with `MORNYE_RUST_ANDROID_ABIS=arm64-v8a` to use these components and skip Rust, CMake, and native-symbol rebuilds. Without that flag, the original complete Rust/CMake build remains available.

## Source and licensing

Mornye is Copyright 2026 Zarz Eleutherius and is distributed under its included LGPL-3.0-only / GPL-3.0 terms. The original `LICENSE`, `COPYING`, `NOTICE`, third-party notices, and complete corresponding source are retained. vMusic launcher artwork is derived from the user-supplied vMusic source resources.

Build the Android ARM64 release with Java 25, Flutter 3.47.7, Rust 1.99.0, Android SDK 37, NDK 30.0.16248370, and CMake 4.1.2:

```sh
export MORNYE_RUST_ANDROID_ABIS=arm64-v8a
export MORNYE_DISCORD_SDK=1
# Optional when using the included, unchanged ARM64 backend:
export MORNYE_PREBUILT_NATIVE=1
flutter pub get
flutter build apk --release --target-platform android-arm64
```

A newly signed APK cannot replace an installation signed with a different key. Back up vMusic data and uninstall the old build first if Android reports a signature conflict.
