import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/configs/colors.dart';

class PrimaryButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final String iconPath;
  const PrimaryButtonWithIcon(
      {super.key,
      required this.buttonText,
      required this.onTap,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 30,
            ),
            SizedBox(width: 15),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
