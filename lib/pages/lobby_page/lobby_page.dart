import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_toe/components/primary_button.dart';
import 'package:tic_tac_toe/components/user_card.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/pages/game_page/multi_player.dart';
import 'package:tic_tac_toe/pages/lobby_page/widgets/pricing_area.dart';
import 'package:tic_tac_toe/pages/lobby_page/widgets/room_info.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TextEditingController roomCode = TextEditingController(text: "13423");
    //final w = MediaQuery.of(context).size.width;
    //final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back(); // Navigate back to the previous page
                      },
                      child: SvgPicture.asset(IconsPath.backIcon),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RoomInfo(roomCode: "23423"),
                const SizedBox(height: 40),
                PriceArea(),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserCard(),
                    UserCard(),
                  ],
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  buttonText: "Start Game",
                  onTap: () {
                    Get.to(() => MultiPlayer());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
