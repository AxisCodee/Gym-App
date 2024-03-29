import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/authentication/provider/auth_provider.dart';
import 'package:gym/authentication/screens/login_screen.dart';
import 'package:gym/components/styles/colors.dart';
import 'package:gym/home/screens/main_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:gym/test.dart';
import 'package:gym/authentication/screens/splash_screen.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider()),],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gym',
          theme: ThemeData(
            // colorScheme: darkThemeColors, // need to extract flutter widget...
            scaffoldBackgroundColor: black,
            fontFamily: 'Saira',
            useMaterial3: true,
          ),
          home: const MainLayout(),
        ),
    );
  }
}

