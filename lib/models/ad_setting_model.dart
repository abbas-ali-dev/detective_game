import 'package:flutter/foundation.dart';

class MoreSettingModel {
  final String? contactId;
  final String? moreAppsIos;
  final String? moreAppsAndroid;
  final String? appStoreId;

  const MoreSettingModel(
      {this.contactId,
      this.moreAppsAndroid,
      this.moreAppsIos,
      this.appStoreId});

  factory MoreSettingModel.fromMap(Map<String, dynamic> map) =>
      MoreSettingModel(
          contactId: map["contact_id"],
          moreAppsAndroid: map["more_apps_android"],
          moreAppsIos: map["more_apps_ios"],
          appStoreId: map["app_store_id"]);
}

enum AdPriority { admob, appLovin, unity, facebook, any }

extension AdPriorityExtension on AdPriority {
  String get value => describeEnum(this);
}

const adPriorityStringToEnumMap = {
  'admob': AdPriority.admob,
  'appLovin': AdPriority.appLovin,
  'unity': AdPriority.unity,
  'facebook': AdPriority.facebook,
  'any': AdPriority.any,
};

class AdSettingsModel {
  final List<AdPriority>? adPriorityList;
  final bool? showAdOnLaunch;
  final int? adTimer;
  final int? interstitialCounter;

  const AdSettingsModel({
    this.adPriorityList,
    this.adTimer,
    this.showAdOnLaunch,
    this.interstitialCounter,
  });

  factory AdSettingsModel.fromMap(Map<String, dynamic> map) {
    return AdSettingsModel(
      adPriorityList: toList(map["ad_priority"]),
      showAdOnLaunch: map["show_ad_on_launch"],
      adTimer: map["ad_timer"],
      interstitialCounter: map["counted_interstitial_count"],
    );
  }

  static List<AdPriority> toList(final List<dynamic> list) => list
      .map<AdPriority>(
          (e) => adPriorityStringToEnumMap[e.toString()] ?? AdPriority.any)
      .toList();
}
