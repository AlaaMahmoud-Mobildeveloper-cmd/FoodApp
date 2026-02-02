import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/core/theming.dart';
import 'package:food/provider/theme_provider.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/localiztion_screen/localizScreen.dart';
import 'package:food/screen/onboarding_screen/onboardingscreen.dart';
import 'package:food/screen/splash_screen/splashscreen.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CachingHelper.init();
  runApp( EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    path: "assets/translation",
    fallbackLocale: Locale('en', 'US'),
    child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp()),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemingApp.lightTheme,
      darkTheme: ThemingApp.darkTheme,
      themeMode:themeProvider.themeMode ,
      debugShowCheckedModeBanner: false,
      initialRoute:LocalizeScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LocalizeScreen.routeName: (context) => LocalizeScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        Homescreen.routeName: (context) => Homescreen(),

      }
      ,
    );
  }
}



