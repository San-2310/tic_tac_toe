import 'package:flutter/material.dart';
import 'package:tic_tac_toe/configs/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const PrimaryButton(
      {super.key, required this.buttonText, required this.onTap});

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
