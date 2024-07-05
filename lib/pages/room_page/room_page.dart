import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_toe/components/primary_button.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              const SizedBox(
                height: 40,
              ),
              Text(
                'Enter Private Code And Join With Your Friend',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  hintText: "Enter Code Here",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttonText: 'Join Now',
                onTap: () {
                  Get.toNamed("/lobby");
                },
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Create Private Room',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Spacer(),
              PrimaryButton(
                buttonText: 'Create Room',
                onTap: () {
                  Get.toNamed("/lobby");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
