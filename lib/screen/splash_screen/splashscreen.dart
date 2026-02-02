import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/core/image_app.dart';
import 'package:food/provider/theme_provider.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/localiztion_screen/localizScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName ="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getNext();
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Stack(
           clipBehavior: Clip.none,
           children: [
             SizedBox(
               width: double.infinity,
               height: 200,

             ),
             Positioned(
               top: -150,
                 child:  Image.asset(AppImage.topSplash,
                   width: 300,
                   fit: BoxFit.cover,
                 )
             )

           ],
         ),
          Image.asset(themeProvider.themeMode==ThemeMode.light
              ?AppImage.lightLogo
              :AppImage.darkLogo
            ,width: 200,),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,

              ),
             Positioned(
                 right: 0,
                 bottom: -160,
                 child: Image.asset(AppImage.bottomSplash,
                   width: 300,
                   fit: BoxFit.cover,
                 )
             )
            ],
          ),
        ],
      ),
    );
  }

  void getNext(){
    Future.delayed(Duration(seconds: 10),(){
      Navigator.pushReplacementNamed(context,CachingHelper.getBool("intro") == true
          ? Homescreen.routeName
          : LocalizeScreen.routeName);
    });

  }
}
