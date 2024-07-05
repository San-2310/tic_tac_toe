import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InGameUserCard extends StatelessWidget {
  final String icon;
  const InGameUserCard({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 140,
          width: w / 2.6,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "Sanjeev Ratnani",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                  height: 25,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -50,
          left: w / 2.6 / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 4,
                )),
          ),
        ),
      ],
    );
  }
}
