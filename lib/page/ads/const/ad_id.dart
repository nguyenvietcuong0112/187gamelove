import 'package:injectable/injectable.dart';

import '../const/ad_id_name.dart';

Map<String, Map<String, String>> myAdsId = {
  Environment.dev: {
    MyAdIdName.interSplash: 'ca-app-pub-3940256099942544/4411468910',
    MyAdIdName.nativeLanguage: 'ca-app-pub-3940256099942544/3986624511',
    MyAdIdName.nativeLanguageSelect: 'ca-app-pub-3940256099942544/3986624511',
    MyAdIdName.nativeIntro1: 'ca-app-pub-3940256099942544/3986624511',
    MyAdIdName.nativeIntro2: '',
    MyAdIdName.nativeIntro3: '',
    MyAdIdName.nativeIntro4: 'ca-app-pub-3940256099942544/3986624511',
    MyAdIdName.nativeHome: 'ca-app-pub-3940256099942544/3986624511',
    MyAdIdName.bannerCollapse: 'ca-app-pub-3940256099942544/8388050270',
    MyAdIdName.appOpenResume: 'ca-app-pub-3940256099942544/5575463023',
  },
  Environment.prod: {
    MyAdIdName.interSplash: '',
    MyAdIdName.nativeLanguage: '',
    MyAdIdName.nativeLanguageSelect: '',
    MyAdIdName.nativeIntro1: '',
    MyAdIdName.nativeIntro2: '',
    MyAdIdName.nativeIntro3: '',
    MyAdIdName.nativeIntro4: '',
    MyAdIdName.nativeHome: '',
    MyAdIdName.bannerCollapse: '',
    MyAdIdName.appOpenResume: '',
  }
};
