// import 'package:detective_game/all_utils.dart';
// import 'package:detective_game/models/ad_setting_model.dart';
// import 'package:detective_game/services/firebase_remote_config.dart';
// import 'package:detective_game/utils/my_ad_id_manager.dart';
//
// class MyAdManager {
//   static const IAdIdManager adIdManager = MyAdIdManager();
//
//   // Singleton instance code
//   static final MyAdManager _instance = MyAdManager._();
//
//   static MyAdManager get instance => _instance;
//
//   MyAdManager._();
//
//   Future<void> initialize() async {
//     const targetingInfo = AdRequest(
//       nonPersonalizedAds: true,
//       keywords: <String>[
//         'criminal',
//         'minds',
//         'killer',
//         'episode',
//         'innocent',
//         'murder',
//         'mystery',
//       ],
//     );
//
//     final requestConf = RequestConfiguration(
//       testDeviceIds: [
//         '75FD9557226308357210C0CBE80AEBFD', // adeel bhai tablet
//         'F11A4F2CCD0BB447FC573BF58881166E', // adeel bhai oppo phone
//         '12C7EC57A67C1E1DA69AB81FACB3CA86', // zahid nokia 6.1
//         '00008030-00163022226A802E',
//         'D98E1FB86FB8EBF408A004D4DCC84F17', // abdullah j7 max
//         '75792c0b6f3fb93524bfab6baf9f9d58', // hanzla's iPhone
//         '072D2F3992EF5B4493042ADC632CE39F', // Mi Phone
//         '0CAE94DF62B6C62D8EA6D89448803B48', // Abd Phone
//         '5C1BA2DBF40FBD73DB5FC68755C6885E', // Ahmad's Poco X3
//       ],
//       maxAdContentRating: MaxAdContentRating.pg,
//     );
//     await EasyAds.instance.initialize(adIdManager,
//         admobConfiguration: requestConf, adMobAdRequest: targetingInfo);
//   }
//
//   bool showPriorityInterstitial({Function? onInterstitialClosed}) {
//     final list = RemoteConfigService.instance.getAdSetting?.adPriorityList;
//     if (list == null || list.isEmpty) {
//       return EasyAds.instance.showAd(AdUnitType.interstitial);
//     }
//
//     for (int i = 0; i < list.length; i++) {
//       if (list[i] == AdPriority.facebook) {
//         if (EasyAds.instance.showAd(AdUnitType.interstitial,
//             adNetwork: AdNetwork.facebook)) return true;
//       } else if (list[i] == AdPriority.admob) {
//         if (EasyAds.instance.showAd(AdUnitType.interstitial,
//             adNetwork: AdNetwork.admob)) return true;
//       } else if (list[i] == AdPriority.unity) {
//         if (EasyAds.instance.showAd(AdUnitType.interstitial,
//             adNetwork: AdNetwork.unity)) return true;
//       } else if (list[i] == AdPriority.appLovin) {
//         if (EasyAds.instance.showAd(AdUnitType.interstitial,
//             adNetwork: AdNetwork.appLovin)) return true;
//       }
//     }
//
//     return EasyAds.instance.showAd(AdUnitType.interstitial);
//   }
//
//   int _count = 0;
//
//   void showCountedInterstitial() {
//     _count++;
//     final serverCounter =
//         RemoteConfigService.instance.getAdSetting?.interstitialCounter ?? 2;
//     if (_count == serverCounter) {
//       showPriorityInterstitial();
//       _count = 0;
//     } else {
//       EasyAds.instance.showAd(AdUnitType.interstitial);
//     }
//   }
// }
