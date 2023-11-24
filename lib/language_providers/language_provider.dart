import 'package:flutter/cupertino.dart';
import 'package:iotsupperapp/language_providers/select_language.dart';

class LanguageProvider extends ChangeNotifier {
  List<SelectLanguageModel> listDropdownValue = [
    SelectLanguageModel('Việt Nam', 'assets/images/VN.png', 'vi'),
    SelectLanguageModel('English', 'assets/images/EN.png', 'en'),
  ];
  late SelectLanguageModel dropdownValue;

  Locale appLocale = const Locale('vi');

  LanguageProvider() {
    appInitLocale();
  }

  Future<Locale> appInitLocale() async {
    dropdownValue = listDropdownValue[0];
    notifyListeners();
    return appLocale;
  }

  void updateLanguage(String languageCode) {
    dropdownValue = listDropdownValue
        .singleWhere((element) => element.locale == languageCode);
    if (languageCode == 'en') {
      appLocale = const Locale('en');
    } else if (languageCode == 'vi') {
      appLocale = const Locale('vi');
    }
    print('gooo ' + languageCode);

    notifyListeners();
  }
}
