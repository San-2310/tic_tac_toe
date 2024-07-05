import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/components/primary_icon_button.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/controllers/auth_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    RxBool isLoading = false.obs;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconsPath.applogo,
                      width: w / 1.6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Please Sign In to Continue",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: h / 6,
                ),
              ],
            ),
            Obx(
              () => isLoading.value
                  ? CircularProgressIndicator()
                  : PrimaryButtonWithIcon(
                      buttonText: "Sign in with Google",
                      onTap: () {
                        isLoading.value = true;
                        authController.login();
                      },
                      iconPath: IconsPath.google,
                    ),
            ),
            SizedBox(
              height: h / 20,
            ),
          ],
        ),
      ),
    );
  }
}
