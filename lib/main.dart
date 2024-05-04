import 'package:flutter/material.dart';
import 'package:quran_app/ui/Screens/SuraContant.dart';
import 'package:quran_app/ui/Screens/home_screen.dart';

void main(){
  runApp(IslamiApp());

}
class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(cardTheme: CardTheme(
        color: Colors.white
      ),primaryColor: Color(0xffB7935F),
          bottomNavigationBarTheme:BottomNavigationBarThemeData(
            backgroundColor: Color(0xffB7935F),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white
          )
          ,scaffoldBackgroundColor: Colors.transparent
      ,appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,

          )),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {

        HomeScreen.routeName:(context) => HomeScreen(),
        SuraContent.routeName:(context) => SuraContent(),
      },


    );
  }
}
