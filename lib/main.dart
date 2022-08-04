import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hh/helper/cach_helper.dart';
import 'package:hh/provider.dart';
import 'package:provider/provider.dart';
import 'helper/dio_helper.dart';
import 'homepage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CashHelper.init();
 bool isDark=CashHelper.getData(key: 'isDark');
  runApp( MyApp(isDark ));
}

class MyApp extends StatelessWidget {
   const MyApp(this.isDark, {Key? key}) : super(key: key);
final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppProvider()..changeAppMode(
             fromShared: isDark
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            return NewsProvider()
              ..getBusiness()
              ..getSports()
              ..getHealth()
              ..getScience()
              ..getTechnology()
              ..getEntertainment();
          },
        )
      ],
      builder: (ctx, _) {
        var provider = Provider.of<AppProvider>(ctx);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                iconTheme: const IconThemeData(color: Colors.white),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0,
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey,
                elevation: 20,
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  bodyText2: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
          theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  bodyText2: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(color: Colors.black),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                  backgroundColor: Colors.white)),
          home: const HomePage(),
        );
      },
    );
  }
}
