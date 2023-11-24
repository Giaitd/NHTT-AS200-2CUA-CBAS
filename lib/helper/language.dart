import 'package:flutter/cupertino.dart';
// import 'package:/helper/app_localizations.dart';
// import 'package:autoclave_model_a/helper/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

String languageText(BuildContext context, String value) {
  return AppLocalizations.of(context)!.translate(value);
}
