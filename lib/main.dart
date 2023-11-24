import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iotsupperapp/view/homepage/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'helper/app_localizations.dart';
import 'language_providers/language_provider.dart';
import 'language_providers/list_provider.dart';
import 'services/screen1_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: listProvider,
      child: MyApp(),
    ),
  );
}

@override
void dependencies() {
  injectService();
}

void injectService() {
  Get.put(Screen1Service());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      locale: languageProvider.appLocale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        //A class which loads the translations from JSON files
        AppLocalizations.delegate,
        //Built-in localization of basic text for Material widgets (means those default Material widget such as alert dialog icon text)
        GlobalMaterialLocalizations.delegate,
        //Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],

      //return a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        //check if the current device locale is supported or not
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode ||
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        //if the locale from the mobile device is not supported yet,
        //user the first one from the list (in our case, that will be English)
        return supportedLocales.first;
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // defaultTransition: Transition.zoom,
      home: MainScreen(),
      builder: EasyLoading.init(),
    );
  }

  static of(BuildContext context) {}
}
