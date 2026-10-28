import 'package:flutter_test/flutter_test.dart';
import 'package:mornye/constants/app_info.dart';

void main() {
  test('desktop release builds mark the version as beta', () {
    expect(
      AppInfo.versionLabel(debug: false, desktop: true),
      '${AppInfo.vmusicVersion} (beta)',
    );
    expect(
      AppInfo.versionLabel(debug: false, desktop: false),
      AppInfo.vmusicVersion,
    );
  });

  test(
    'extension host compatibility remains independent of vMusic branding',
    () {
      expect(AppInfo.appName, 'vMusic');
      expect(AppInfo.vmusicVersion, '1.0.9');
      expect(AppInfo.version, '5.2.6');
    },
  );

  test('debug builds stay internal on every platform', () {
    expect(AppInfo.versionLabel(debug: true, desktop: true), 'Internal');
    expect(AppInfo.versionLabel(debug: true, desktop: false), 'Internal');
  });
}
