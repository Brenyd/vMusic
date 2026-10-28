import 'package:flutter/foundation.dart';
import 'package:mornye/utils/desktop_platform.dart';

class AppInfo {
  // Extension repository and native-host compatibility stays on Mornye 5.2.6.
  static const String version = '5.2.6';
  static const String buildNumber = '165';
  static const String vmusicVersion = '1.0.9';
  static const String vmusicBuildNumber = '9';
  static const String displayBuildNumber = vmusicBuildNumber;

  static const String gitCommit = String.fromEnvironment('GIT_COMMIT');
  static String get shortGitCommit =>
      gitCommit.length > 8 ? gitCommit.substring(0, 8) : gitCommit;

  /// The version shown to people; desktop builds are still in beta.
  static String get displayVersion => versionLabel();

  @visibleForTesting
  static String versionLabel({bool debug = kDebugMode, bool? desktop}) {
    if (debug) return 'Internal';
    return desktop ?? isDesktopPlatform
        ? '$vmusicVersion (beta)'
        : vmusicVersion;
  }

  static const String appName = 'vMusic';
  static const String license = 'LGPL-3.0-only';
  static const String copyright =
      'vMusic derivative · Mornye © 2026 Zarz Eleutherius';

  static const String mobileAuthor = 'zarzet';

  static const String githubRepo = 'mornyeapp/Mornye';
  static const String githubUrl = 'https://github.com/$githubRepo';

  /// Desktop packages are published here; the source stays in [githubRepo].
  static const String desktopGithubRepo = 'mornyeapp/Mornye-Desktop';
  // The server keeps the endpoint name from before the rename.
  static const String remoteConfigApiUrl =
      'https://api.zarz.moe/v1/spotiflac-mobile/config';

  static const String kofiUrl = 'https://ko-fi.com/zarzet';
  static const String githubSponsorsUrl = 'https://github.com/sponsors/zarzet/';
}
