import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/components/in_game_user_card.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';

class MultiPlayer extends StatelessWidget {
  const MultiPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    var playValue = ["X", "O", "X", "O", "", "", "O", "X", "X"];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: SvgPicture.asset(IconsPath.smsIcon),
        ),
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
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InGameUserCard(
                              icon: IconsPath.xIcon,
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
                                  Text("WON: 12"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InGameUserCard(
                              icon: IconsPath.oIcon,
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
                                  Text("WON: 12"),
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
                          GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: ((context, index) {
                              return Container(
                                margin: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: playValue[index] == "X"
                                      ? Theme.of(context).colorScheme.primary
                                      : playValue[index] == "O"
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : playValue[index] == ""
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
                                  child: playValue[index] == "X"
                                      ? SvgPicture.asset(
                                          IconsPath.xIcon,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          width: 45,
                                        )
                                      : playValue[index] == "O"
                                          ? SvgPicture.asset(
                                              IconsPath.oIcon,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                              width: 50,
                                            )
                                          : playValue[index] == ""
                                              ? SizedBox()
                                              : SizedBox(),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
