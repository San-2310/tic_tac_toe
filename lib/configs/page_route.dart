import 'package:get/route_manager.dart';
import 'package:tic_tac_toe/pages/auth/auth_page.dart';
import 'package:tic_tac_toe/pages/game_page/multi_player.dart';
import 'package:tic_tac_toe/pages/game_page/single_player.dart';
import 'package:tic_tac_toe/pages/home_page/home_page.dart';
import 'package:tic_tac_toe/pages/lobby_page/lobby_page.dart';
import 'package:tic_tac_toe/pages/room_page/room_page.dart';
import 'package:tic_tac_toe/pages/splash_screen/splash_screen.dart';
import 'package:tic_tac_toe/pages/update_profile/update_profile.dart';
import 'package:tic_tac_toe/pages/welcome/welcome_page.dart';

var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),
  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),
  GetPage(
    name: "/auth",
    page: () => AuthPage(),
  ),
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),
  GetPage(
    name: "/splash",
    page: () => SplashScreen(),
  ),
  GetPage(
    name: "/game",
    page: () => MultiPlayer(),
  ),
  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfile(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),
  GetPage(
    name: "/singlePlayer",
    page: () => SinglePlayer(),
  ),
  GetPage(
    name: "/multiPlayer",
    page: () => MultiPlayer(),
  ),
];
