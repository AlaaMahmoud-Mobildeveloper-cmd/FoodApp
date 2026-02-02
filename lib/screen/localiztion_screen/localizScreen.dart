import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/core/image_app.dart';
import 'package:food/core/style.dart';
import 'package:food/provider/theme_provider.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/onboarding_screen/onboardingscreen.dart';
import 'package:provider/provider.dart';

class LocalizeScreen extends StatelessWidget {
  const LocalizeScreen({super.key});
  static const String routeName = 'LocalizeScreen';
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:   Image.asset(themeProvider.themeMode==ThemeMode.light
            ?AppImage.lightLogo
            :AppImage.darkLogo,width: 200,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImage.loc,width: 200,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("titleIntro".tr(),
                  textAlign: TextAlign.start,
                  style: AppStyle.titleStyle.copyWith(color: Theme.of(context).colorScheme.primary),),
                Text("supTitleIntro".tr(),
                  style: AppStyle.bodyIntroStyle,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("lun".tr(),
                    style:AppStyle.titleStyle.copyWith(color: Theme.of(context).colorScheme.primary) ,),
                ),
               Row(
                 spacing: 10,
                    children: [
                     GestureDetector(
                       onTap: (){
                         if( context.locale !=Locale('ar', 'EG')){
                           context.setLocale(Locale('ar', 'EG'));
                         }else{
                           context.setLocale(Locale('en', 'US'));
                         }
                       },
                       child: Container(
                         width: 60,
                         height: 40,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Theme.of(context).colorScheme.primary,
                         ),
                         child: Text(context.locale !=Locale('ar', 'EG')
                             ?"En"
                             :"Ar"
                           ,textAlign: TextAlign.center
                           ,style: AppStyle.bodyIntroStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: 30),),
                       ),
                     ),

                    ]
                  ),

              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("theme".tr(),
                    style:AppStyle.titleStyle.copyWith(color: Theme.of(context).colorScheme.primary) ,),
                ),
                Row(
                    spacing: 10,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(themeProvider.themeMode == ThemeMode.dark){
                            themeProvider.changeTheme(
                              ThemeMode.light,
                            );
                          }else{
                            themeProvider.changeTheme(
                              ThemeMode.dark,
                            );
                          }

                        },
                        child: Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary
                            ),
                            color: themeProvider.themeMode == ThemeMode.light
                                ?Theme.of(context).colorScheme.primary
                                :Theme.of(context).colorScheme.surface,
                          ),
                          child:Icon(Icons.light_mode,size: 30,color:themeProvider.themeMode == ThemeMode.light
                              ?Theme.of(context).colorScheme.surface
                              :Theme.of(context).colorScheme.primary,)
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: (){
                      //     themeProvider.changeTheme(
                      //       ThemeMode.dark,
                      //     );
                      //   },
                      //   child: Container(
                      //     width: 60,
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color:themeProvider.themeMode == ThemeMode.light
                      //             ?Theme.of(context).colorScheme.surface
                      //             :Theme.of(context).colorScheme.primary,
                      //         border: Border.all(color: Theme.of(context).colorScheme.primary)
                      //     ),
                      //     child: Icon(Icons.dark_mode,size: 30,color:themeProvider.themeMode != ThemeMode.light
                      //         ?Theme.of(context).colorScheme.onPrimary
                      //         :Theme.of(context).colorScheme.primary,)
                      //   ),
                      // ),
                    ]
                ),

              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  backgroundColor:Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: (){

                 Navigator.pushNamedAndRemoveUntil(context, OnboardingScreen.routeName, (route)=>false);
            }, child: Text("go".tr(),style: AppStyle.bodyIntroStyle.copyWith(color:Theme.of(context).colorScheme.onPrimary,fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}
