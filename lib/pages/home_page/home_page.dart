import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/components/primary_icon_button.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/pages/game_page/single_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TIC TAC TOE",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "With Multiplayer",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              SvgPicture.asset(
                IconsPath.applogo,
                width: w / 1.8,
              ),
              SizedBox(
                height: h / 25,
              ),
              PrimaryButtonWithIcon(
                buttonText: "Single Player",
                onTap: () {
                  Get.to(() => SinglePlayer());
                },
                iconPath: IconsPath.user,
              ),
              SizedBox(
                height: h / 50,
              ),
              PrimaryButtonWithIcon(
                buttonText: "Multi Player",
                onTap: () {
                  Get.toNamed("/room");
                },
                iconPath: IconsPath.group,
              ),
              SizedBox(
                height: h / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        IconsPath.info,
                        width: w / 10,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        IconsPath.game,
                        width: w / 10,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        IconsPath.github,
                        width: w / 10,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        IconsPath.youtube,
                        width: w / 10,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
