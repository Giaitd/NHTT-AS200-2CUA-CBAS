import 'package:provider/provider.dart';

import 'language_provider.dart';

var listProvider = [
  ChangeNotifierProvider<LanguageProvider>(
    create: (context) => LanguageProvider(),
  ),
];
