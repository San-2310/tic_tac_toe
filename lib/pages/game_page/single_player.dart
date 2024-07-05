import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/controllers/single_player_controller.dart';

class SinglePlayer extends StatelessWidget {
  const SinglePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    //var playValue = ["X", "O", "X", "", "", "", "O", "X", "X"];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    SinglePlayerController singlePlayerController =
        Get.put(SinglePlayerController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    "Play Game",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.xIcon,
                            height: 45,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SvgPicture.asset(IconsPath.wonIcon),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(
                                () => Text(
                                  "WON: ${singlePlayerController.xScore}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 22.5,
                            horizontal: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.oIcon,
                            height: 60,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SvgPicture.asset(IconsPath.wonIcon),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(
                                () => Text(
                                  "WON: ${singlePlayerController.oScore}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h / 15,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 1,
                dashPattern: [10, 10],
                radius: Radius.circular(20),
                child: Container(
                  margin: EdgeInsets.all(7),
                  width: w / 1.2,
                  height: w / 1.2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: w / 1.22,
                          height: w / 1.22,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      Obx(
                        () => GridView.builder(
                          itemCount: singlePlayerController.playValue.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                singlePlayerController.onClick(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: singlePlayerController
                                              .playValue[index] ==
                                          "X"
                                      ? Theme.of(context).colorScheme.primary
                                      : singlePlayerController
                                                  .playValue[index] ==
                                              "O"
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : singlePlayerController
                                                      .playValue[index] ==
                                                  ""
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                  borderRadius: index == 0
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(20.0))
                                      : index == 2
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(20.0))
                                          : index == 6
                                              ? const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0))
                                              : index == 8
                                                  ? const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(20.0))
                                                  : const BorderRadius.only(),
                                ),
                                child: Center(
                                  child:
                                      singlePlayerController.playValue[index] ==
                                              "X"
                                          ? SvgPicture.asset(
                                              IconsPath.xIcon,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                              width: 45,
                                            )
                                          : singlePlayerController
                                                      .playValue[index] ==
                                                  "O"
                                              ? SvgPicture.asset(
                                                  IconsPath.oIcon,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer,
                                                  width: 50,
                                                )
                                              : singlePlayerController
                                                          .playValue[index] ==
                                                      ""
                                                  ? SizedBox()
                                                  : SizedBox(),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: singlePlayerController.isXtime.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          singlePlayerController.isXtime.value
                              ? SvgPicture.asset(
                                  IconsPath.xIcon,
                                  height: 20,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                )
                              : SvgPicture.asset(
                                  IconsPath.oIcon,
                                  height: 20,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Turn",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
