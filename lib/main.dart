import 'package:allaboutapps/Model/ClubListModel.dart';
import 'package:allaboutapps/SharedPreferences/SharedPreferencesManager.dart';
import 'package:allaboutapps/View/ClubList/ClubListView.dart';
import 'package:allaboutapps/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Localisation/LanguageConstants.dart';
import 'Localisation/Localization.dart';
import 'Network/DioManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedPreferencesManager>(
          create: (context) => SharedPreferencesManager(),
        ),
        Provider<DioManager>(
          create: (context) => DioManager(),
        ),
        ChangeNotifierProvider<LocaleHelper>(
          create: (context) => LocaleHelper(Provider.of<SharedPreferencesManager>(context, listen: false)),
        )
      ],
      child: Consumer<LocaleHelper>(
        builder: (context, model, child){
          return MaterialApp(
            title: 'AllAboutClubs',
            theme: ThemeData(
              primarySwatch: buildMaterialColor(Color(0xFF01C13B)),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white
                ),
              ),
            ),
            localizationsDelegates: [
              Localization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
            locale: Locale(model.getLanguageCode()),
            routes: {
              '/' : (context) => ChangeNotifierProvider<ClubListModel>(create: (context) => ClubListModel(context, Provider.of<DioManager>(context, listen: false)), child: ClubListView(),)
            },
          );
        },
      ),
    );
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}