// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class BS {
  BS();

  static BS? _current;

  static BS get current {
    assert(_current != null,
        'No instance of BS was loaded. Try to initialize the BS delegate before accessing BS.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<BS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BS();
      BS._current = instance;

      return instance;
    });
  }

  static BS of(BuildContext context) {
    final instance = BS.maybeOf(context);
    assert(instance != null,
        'No instance of BS present in the widget tree. Did you add BS.delegate in localizationsDelegates?');
    return instance!;
  }

  static BS? maybeOf(BuildContext context) {
    return Localizations.of<BS>(context, BS);
  }

  /// `intro_title_1`
  String get intro_title_1 {
    return Intl.message(
      'intro_title_1',
      name: 'intro_title_1',
      desc: '',
      args: [],
    );
  }

  /// `intro_des_1`
  String get intro_des_1 {
    return Intl.message(
      'intro_des_1',
      name: 'intro_des_1',
      desc: '',
      args: [],
    );
  }

  /// `intro_title_2`
  String get intro_title_2 {
    return Intl.message(
      'intro_title_2',
      name: 'intro_title_2',
      desc: '',
      args: [],
    );
  }

  /// `intro_des_2`
  String get intro_des_2 {
    return Intl.message(
      'intro_des_2',
      name: 'intro_des_2',
      desc: '',
      args: [],
    );
  }

  /// `intro_title_3`
  String get intro_title_3 {
    return Intl.message(
      'intro_title_3',
      name: 'intro_title_3',
      desc: '',
      args: [],
    );
  }

  /// `intro_des_3`
  String get intro_des_3 {
    return Intl.message(
      'intro_des_3',
      name: 'intro_des_3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get start_now {
    return Intl.message(
      'Start now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `This action can contain ads`
  String get this_action_can_contain_ads {
    return Intl.message(
      'This action can contain ads',
      name: 'this_action_can_contain_ads',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get rate_us {
    return Intl.message(
      'Rate us',
      name: 'rate_us',
      desc: '',
      args: [],
    );
  }

  /// `Rated`
  String get rated {
    return Intl.message(
      'Rated',
      name: 'rated',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Schedule call`
  String get schedule_call {
    return Intl.message(
      'Schedule call',
      name: 'schedule_call',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Share this app`
  String get share_app {
    return Intl.message(
      'Share this app',
      name: 'share_app',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<BS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<BS> load(Locale locale) => BS.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
