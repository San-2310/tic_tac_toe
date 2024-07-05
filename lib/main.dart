import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_toe/configs/page_route.dart';
import 'package:tic_tac_toe/configs/theme.dart';
import 'package:tic_tac_toe/firebase_options.dart';
import 'package:tic_tac_toe/pages/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: pages,
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      //home: RoomPage(),
      home: SplashScreen(),
    );
  }
}
