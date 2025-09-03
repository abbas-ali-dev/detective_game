// import 'package:detective_game/all_utils.dart';
// import 'package:detective_game/models/ad_setting_model.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/foundation.dart';
//
// class RemoteConfigService {
//   static final RemoteConfigService _instance = RemoteConfigService._();
//   static RemoteConfigService get instance => _instance;
//   late RemoteConfig _remoteConfig;
//   RemoteConfigService._();
//   MoreSettingModel? _moreSettingModel;
//   AdSettingsModel? _adSettingModel;
//   static const _keyMoreSetting = "more_settings";
//   static const _keyAdSetting = "ad_settings";
//   String get _moreSettingJson => _remoteConfig.getString(_keyMoreSetting);
//   String get _adSettingsJson => _remoteConfig.getString(_keyAdSetting);
//   MoreSettingModel? get getMoreSetting => _moreSettingModel;
//   AdSettingsModel? get getAdSetting => _adSettingModel;
//
//   Future init() async {
//     _remoteConfig = RemoteConfig.instance;
//     _remoteConfig.setDefaults(<String, dynamic>{
//       _keyMoreSetting:
//           '{   "contact_id": "nalitt.apps@gmail.com",   "more_apps_ios": "https://apps.apple.com/us/developer/hosni-macabando/id1170635940",   "more_apps_android": "market://search?q=pub:Clay+Rock+Studio",   "app_store_id": "1554856807" }',
//       _keyAdSetting:
//           '{   "ad_timer": 0,   "show_ad_on_launch": true,   "ad_priority": [     "admob",     "facebook",     "unity",     "appLovin" ,"any"  ],   "counted_interstitial_count": 2 }',
//     });
//     try {
//       await _remoteConfig.fetchAndActivate();
//
//       if (kDebugMode) {
//         _remoteConfig.setConfigSettings(
//           RemoteConfigSettings(
//             fetchTimeout: const Duration(seconds: 10),
//             minimumFetchInterval: const Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (_) {}
//     final moreSetting = jsonDecode(_moreSettingJson);
//     final adPriority = jsonDecode(_adSettingsJson);
//     _moreSettingModel = MoreSettingModel.fromMap(moreSetting);
//     _adSettingModel = AdSettingsModel.fromMap(adPriority);
//   }
// }
