import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mornye/models/settings.dart';
import 'package:mornye/models/theme_settings.dart';
import 'package:mornye/theme/dynamic_color_wrapper.dart';

void main() {
  test('new installs use vMusic visual and local-first defaults', () {
    const theme = ThemeSettings();
    expect(theme.themeMode, ThemeMode.dark);
    expect(theme.useDynamicColor, isFalse);
    expect(theme.useAmoled, isTrue);
    expect(theme.seedColorValue, 0xFFF05D56);
    const settings = AppSettings();
    expect(settings.localLibraryEnabled, isTrue);
    expect(settings.localLibraryAutoScan, 'on_open');
    expect(settings.showExtensionStore, isTrue);
    expect(settings.checkForUpdates, isFalse);
  });

  test('vMusic palette preserves its original surface and text colors', () {
    final scheme = vMusicDarkColorScheme();
    expect(scheme.primary, const Color(0xFFF05D56));
    expect(scheme.secondary, const Color(0xFF6F9FEF));
    expect(scheme.surface, Colors.black);
    expect(scheme.surfaceContainer, const Color(0xFF282828));
    expect(scheme.surfaceContainerHigh, const Color(0xFF292929));
    expect(scheme.surfaceContainerHighest, const Color(0xFF333333));
    expect(scheme.onSurface, Colors.white);
    expect(scheme.onSurfaceVariant, const Color(0xFFA3A3A3));
    expect(scheme.outline, const Color(0xFF6F6F6F));
  });
}
