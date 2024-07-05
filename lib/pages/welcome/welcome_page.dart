import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/pages/auth/auth_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pages = [
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome1),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const Text(
              "Most fun game now available on your smartphone device!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome2),
            const Text(
              "Compete",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const Text(
              "Play online with your friends and top the leaderboard!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome3),
            const Text(
              "Scoreboard",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const Text(
              "Earn points for each game and make your way to top the scoreboard!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Get.offAll(
                  () => AuthPage(),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(253, 224, 232, 1),
                ),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color.fromRGBO(243, 197, 210,
                        0.8); // Change to the desired color when pressed
                  }
                  return Color.fromRGBO(
                      253, 224, 232, 1); // Use the default overlay color
                }),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
        body: ConcentricPageView(
            itemCount: 3,
            physics: BouncingScrollPhysics(),
            itemBuilder: (index) {
              return pages[index];
            },
            onFinish: () {
              Get.offAll(
                AuthPage(),
              );
            },
            colors: [
          Color.fromRGBO(253, 224, 232, 1),
          Color.fromRGBO(243, 197, 210, 1),
          Color.fromRGBO(221, 171, 185, 1)
        ]));
  }
}
