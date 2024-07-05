import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tic_tac_toe/configs/messages.dart';
import 'package:tic_tac_toe/models/user_model.dart';
import 'package:tic_tac_toe/pages/home_page/home_page.dart';

// class ProfileController extends GetxController {
//   final ImagePicker picker = ImagePicker();
//   final store = FirebaseStorage.instance;
//   final auth = FirebaseAuth.instance;
//   final db = FirebaseFirestore.instance;

//   Future<void> updateProfile(String name, String imagePath) async {
//     try {
//       var uploadedImageUrl = await uploadImageToFirebase(imagePath);

//       var newUser = UserModel(
//         id: auth.currentUser!.uid,
//         name: name,
//         image: uploadedImageUrl,
//         email: auth.currentUser!.email,
//         totalWins: "0",
//       );

//       await db
//           .collection("users")
//           .doc(auth.currentUser!.uid)
//           .set(newUser.toJson());
//       successMessage("Profile Updated!");
//       Get.offAll(() => HomePage());
//     } catch (e) {
//       print(e);
//       errorMessage("Profile update failed");
//     }
//   }

//   Future<String> uploadImageToFirebase(String imagePath) async {
//     final path = "files/${imagePath}";
//     final file = File(imagePath);
//     if (imagePath != "") {
//       try {
//         final ref = store.ref().child(path).putFile(file);
//         final uploadTask = await ref.whenComplete(() {});
//         final downloadImageUrl = await uploadTask.ref.getDownloadURL();
//         print(downloadImageUrl);
//         return downloadImageUrl;
//       } catch (ex) {
//         print(ex);
//         return "";
//       }
//     }
//     return "";
//   }

//   Future<String> pickImage(ImageSource source) async {
//     final XFile? image = await picker.pickImage(source: source);
//     if (image != null) {
//       return image.path;
//     } else {
//       return "";
//     }
//   }
//}
class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final store = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> updateProfile(String name, String imagePath) async {
    isLoading.value = true;
    try {
      if (imagePath != "" && name != "") {
        var uploadedImageUrl = await uploadImageToFirebase(imagePath);

        var newUser = UserModel(
          id: auth.currentUser!.uid,
          name: name,
          image: uploadedImageUrl,
          email: auth.currentUser!.email,
          totalWins: "0",
        );
        await db.collection("users").doc(auth.currentUser!.uid).set(
              newUser.toJson(),
            );
        successMessage("Profile Updated");
        Get.offAll(() => HomePage());
        isLoading.value = false;
      } else {
        errorMessage("Please fill all the fields");
      }
    } catch (e) {
      print(e);
      errorMessage("Profile Update Failed");
    }
    isLoading.value = false;
  }

  Future<String> uploadImageToFirebase(String imagePath) async {
    final path = "files/${imagePath}";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (ex) {
        print(ex);
        return "";
      }
    }
    return "";
  }

  Future<String> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return image.path;
    } else {
      return "";
    }
  }
}
