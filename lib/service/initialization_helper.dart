// import 'dart:async';
//
// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
// import 'package:get/get.dart';
//
//
// class InitializationHelper {
//   Future<void> initialize() async {
//     await _initializeAdmob();
//
//     // final TrackingStatus status =
//     // await AppTrackingTransparency.trackingAuthorizationStatus;
//     //
//     // if (status == TrackingStatus.notDetermined) {
//     //   await Future.delayed(const Duration(milliseconds: 200));
//     //   await AppTrackingTransparency.requestTrackingAuthorization().then(
//     //         (value) async {
//     //       if (value == TrackingStatus.authorized) {
//     //         await _initializeGDPR();
//     //       } else {
//     //         await _initializeAdmob();
//     //       }
//     //     },
//     //   );
//     // } else {
//     //   await _initializeAdmob();
//     // }
//   }
//
//   Future<FormError?> _initializeGDPR() async {
//     final completer = Completer<FormError?>();
//
//     final params = ConsentRequestParameters(
//       consentDebugSettings: ConsentDebugSettings(
//         debugGeography: DebugGeography.debugGeographyEea,
//       ),
//     );
//     ConsentInformation.instance.requestConsentInfoUpdate(params, () async {
//       if (await ConsentInformation.instance.isConsentFormAvailable()) {
//         await _loadConsentForm();
//       } else {
//         await _initializeAdmob();
//       }
//       completer.complete();
//     }, (error) {
//       completer.complete(error);
//     });
//     return completer.future;
//   }
//
//   Future<FormError?> _loadConsentForm() async {
//     final completer = Completer<FormError?>();
//     ConsentForm.loadConsentForm((consentForm) async {
//       final status = await ConsentInformation.instance.getConsentStatus();
//       if (status == ConsentStatus.required) {
//         consentForm.show((formError) {
//           completer.complete(_loadConsentForm());
//         });
//       } else {
//         await _initializeAdmob();
//         completer.complete();
//       }
//     }, (formError) {
//       completer.complete(formError);
//     });
//     return completer.future;
//   }
//
//   Future<void> _initializeAdmob() async {
//     final IAdIdManager adIdManager = MyAdIdManager();
//     await EasyAds.instance.initialize(
//       adIdManager,
//       unityTestMode: true,
//       adMobAdRequest: const AdRequest(httpTimeoutMillis: 60000),
//       admobConfiguration: RequestConfiguration(testDeviceIds: ['']),
//       navigatorKey: Get.key,
//     );
//     await EasyAds.instance
//         .initAdmob(appOpenAdUnitId: MyAdIdName.appOpenResume.getId);
//   }
// }
