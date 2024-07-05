import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tic_tac_toe/components/primary_icon_button.dart';
import 'package:tic_tac_toe/configs/assets_path.dart';
import 'package:tic_tac_toe/controllers/profile_controller.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final ProfileController profileController = Get.put(ProfileController());
  final RxString imagePath = "".obs;
  final TextEditingController nameController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: h / 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10),
                  Obx(() {
                    return imagePath.value.isEmpty
                        ? Container(
                            width: w / 2.1,
                            height: w / 2.1,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: Colors.grey,
                            ),
                          )
                        : Container(
                            width: w / 2.1,
                            height: w / 2.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.file(
                                File(imagePath.value),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                  }),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          String? pickedImagePath = await profileController
                              .pickImage(ImageSource.gallery);
                          if (pickedImagePath != null) {
                            imagePath.value = pickedImagePath;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.gallery,
                            width: w / 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      InkWell(
                        onTap: () async {
                          String? pickedImagePath = await profileController
                              .pickImage(ImageSource.camera);
                          if (pickedImagePath != null) {
                            imagePath.value = pickedImagePath;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SvgPicture.asset(
                            IconsPath.camera,
                            width: w / 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: h / 20),
              TextFormField(
                controller: nameController2,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                ),
              ),
              SizedBox(height: h / 40),
              Text(
                "You can change these details later from profile page. Don't worry!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              SizedBox(height: h / 8),
              Obx(
                () => profileController.isLoading.value
                    ? CircularProgressIndicator()
                    : PrimaryButtonWithIcon(
                        buttonText: "Save",
                        onTap: () {
                          profileController.updateProfile(
                              nameController2.text, imagePath.value);
                        },
                        iconPath: IconsPath.save,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
